package classblast.admin

class Archivo {
	enum Filetype {
		PDF,JPG,PNG,XLS,DOC,DOCX,ZIP,RAR,SWF,MP3,MP4,AVI,WMA,XLSX,PPT,PPTX,TXT,Z7Z
	}
	String fileTitle
	String fileDescription
	java.util.Date uploadDateOfFile// No hay seguridad de esta implementación
	Grupo course   // grupo asociado al archivo
	User owner     // propietario del archivo
	String fileLink // enlace del archivo
	Filetype fileType // tipo de archivo
    static constraints = {
    }
}
