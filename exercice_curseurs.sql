--Exercice
/*
soientt les tables suivantes :
Stagiaire(id,nom,prenom,age,id_groupe)
groupe(id_groupe,annee,filiere,numero)

1-Ecrire un programme qui permet d'afficher les n premiers stagiaires
les plus agés.
2-Récupérer la liste des groupes de 1ère année et les afficher sous
la forme 1TD1 - 1TD2...
3-Modifier le programme de telle sorte à ce que le nombre de stagaires
soit affiché devant chaque groupe.

4) Modifier le script en affichant les stagiaires de chaque groupe.
*/

/*----Creation des tables

create table groupe(
id_group int  identity primary key,
annee int,
filliere varchar(20),
numero varchar(20)
)

create table stagiaire(
id int identity primary key,
nom varchar(20),
prenom varchar(20),
age int,
id_group int references groupe(id_group)
)

drop table stagiaire

insert into groupe values(2,'developpement','3')
insert into groupe values(1,'Reseauxinformatiques','1')

select * from stagiaire

insert into stagiaire values('sakout','mehdi',70,1)
insert into stagiaire values('aaniba','ismaeil',70,6)
insert into stagiaire values('xxx','hhh',20,6)
insert into stagiaire values('iu','uioi',10,1)
insert into stagiaire values('pkijk','i',13,1)*/

--------

declare @id int,@nom varchar(20),@prenom varchar(20),@age int
declare @longueur int
declare @indice int

set @longueur=4
set @indice=1

declare cursy cursor

for SELECT id,nom,prenom,age from stagiaire order by age desc

open cursy

fetch cursy into @id,@nom,@prenom,@age
while(@@fetch_status=0  and @indice<=@longueur)
begin
print @nom+' '+@prenom+' '+convert(varchar(10),@age)
fetch cursy into @id,@nom,@prenom,@age
set @indice=@indice+1
end
close cursy
deallocate cursy
