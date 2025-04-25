Example usage

```
import fastjet_recombiner.recombiner as recombiner
reComb = recombiner.MyRecombiner.instance()
jetdef = fastjet.JetDefinition0Param(fastjet.ee_kt_algorithm)
jetdef.set_recombiner(reComb)
```
and make jets as normal
