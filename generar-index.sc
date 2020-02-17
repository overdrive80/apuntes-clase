#!/usr/bin/env scala
// INSTALAR AMMONITE
// sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/1.1.2/2.12-1.1.2) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && amm

object A{

  import java.io._


  def allFiles(current: File) : Stream[File] = {

    val includeExtensions = Seq( ".pdf", ".html", "epub" )
    val excludeExtensions = Seq( ".svg.pdf" )


    def sanitizeArray[T]( a: Array[T] )(implicit m: scala.reflect.ClassTag[T]) = if(a == null)  new Array[T](0) else a
    def extensionFilter(f:File) = {
      val name = f.getName.toLowerCase
      includeExtensions.exists( name.endsWith(_) ) && excludeExtensions.forall( !name.endsWith(_) )
    }

    def includeFilter(f:File) = {
      val name = f.getPath.toLowerCase
      name.contains("apuntes") && !name.contains("media")
    }

    if( current.isDirectory ){
      println( s"Mirando directorio $current")
      val all = sanitizeArray( current.listFiles ).sorted
      val files = all.filter(extensionFilter).filter(includeFilter)
      val directories = all.filter( _.isDirectory )
      lazy val recurse = directories.map(allFiles(_))
      files.toStream #::: recurse.foldLeft( Stream[File]() )( _ #::: _ )
    }
    else{
      Stream()
    }

  }

  def toLink( f : File ) = {
    val link = f.getPath
    <li><a href={link}>{link}</a></li>
  }

  def doPage( dir : File, out : Writer ) = {
    val files = allFiles( new File(".") )
    val links = files.map(toLink)
    out.write(
      <html>
        <head>
          <style>
          </style>
        </head>
        <body>
            <ul>
              {links}
            </ul>
        </body>
      </html>.toString
    )
  }
}

val out = new java.io.FileWriter("index.html")
A.doPage( new java.io.File("."), out )
out.close()
println("Done")
