Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202992;
	b=1IMUkVbVklpFbngzWBT6BeuAmZIP4r7AnPP68JvmAHC+ZAQQfkDeTxRfcKTSdcEfCXE3
	 AXZY8aB10fvQA1g1qT5OsGjKK7wq86grx2iZXW9URll64Z+NfbpIFqqjHr2tOGHFE+A1r
	 7WQhbu1VgHZ5WgK2Lxu7MngYH22WCT3PM9SiRVhsVBBOB7zMDHelhqQI+4ma9hYzYTWR8
	 dc+qqLCKa3GLnyp4WW23hmYhHd00qnbULsbqMTI92+aCS+yuiRSr8cjFIieQIT76Di4A8
	 tcbsydGEEYmePQR3csPNKAUFLEKruyMFeCLFFK2jlsT4IaTgJpz3aYBtjgrf3w9AHOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fC+8G1FvYGo13nT/z8VOaxvmjaFeFWbWTyaE4x7H7KU=;
	b=INfy/wHYzgP65JrH5rLHgovvaRXo30dDhaIBGWLjqJ7t3JzZd2zFbwo4Z2BDav4905iM
	 YdtnT+TAhoHnHYWrCtSzbGNfDkp4aqkA3epIgYWRMayIRSySrprNlFtp0KMudtAZNPGv9
	 9I9NfbdruNVphn32Rb8vXvNlk9iTZTmAlEAWKLA6eYtGEhM4qoy6KGkDq2xv/0eBk8Tiz
	 LOWEmonS0q5Ort3lF7EzW4rK0PfzXq5iqPGKUf/a5fCnZKBdpuCu93b06i2m2EeM4CDdf
	 D7c5hIBJOtw/gxz5VV6VI5ApbB8tUbUdd5b6ynYABYaVZqmoJFxhMfhSMIfR9R0+E2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUoVuok9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE360A3803
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20DE360A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUoVuok9
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso195380066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202989; cv=none;
        d=google.com; s=arc-20260327;
        b=ln9p2FoJe1KMmehZN3WnMuo2zV/TGGYzzEsaP/zcGtidP+SSvlsaPX6vUZbSU4iyom
         gLArLN6BqoGARQOOvvb4y0sa0dLsoCZtML+OvJK4Mc4PxiM/eLsacFwgjX59jVZuXS3u
         2cyPMDw2BNWc37ck4GLB1UgD9eMSZ4n3jnxr1pbtyTv4yLSV0LDLFfQl6vl1f1khRcsx
         fdsLD+srPi89S1KKEv1taMBa+jdpGDxoqR5VnwyqOCno1CT55SlMFV+2V2fmQX2wI1Vz
         vMeJqm2AZJ5F3NULxH8SR9nV1Z5uQacwK2/Zes5wbactxyswMJ2LRmQcusxOMVj7oQt9
         HTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fC+8G1FvYGo13nT/z8VOaxvmjaFeFWbWTyaE4x7H7KU=;
        fh=uLbxd5SAiUHXYY0LRXBhWsLmh8p7UNMMiELviQZ8t+A=;
        b=EF6NxzS+HGVWw3WbtjixClTbDTumNsPqemwaSsbKhnPeCu8LtYEyeMV9no6KF6x+Bg
         D86swgM6PTkDTxsVuihX61a+gWIcw7/+19okQFwQiBTNZR1+dfysEm55GR1ZKGNg4yGj
         9/5n+x8jtxYay+38IUJS1wfLDHi9sVrIqktMys9zTRmwN9QWc0dOtw+Y8KtLJTyWvKoc
         nt/3ZdU9nXL0Ui5dqSrdZ36+TRo3EBfAEwV4lzAv4eV35J40xwrIwkwGPn0sGzGzO6CF
         FPVRkvxi3bJ5YsNYO8cYokvxJq3GzFQJu/OaDrhv9xb7GVLHCL6kFdFW2CpVvP0ETyN4
         SQkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202989; x=1795807789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fC+8G1FvYGo13nT/z8VOaxvmjaFeFWbWTyaE4x7H7KU=;
        b=bUoVuok9ZITcgLihiI+7J968zYkTWUWrusvXBCd5TGCAX0oY5A89t9/zFspC1iq4Q3
         70oQIL47ELrZ77ppqvQulS7tCRyrnn5voEdyWb7PU2BVUpx2RbpoNkRALU9IEGogy1v2
         37WXmRSeQIXUf/Qa76w2yb5PUyy4E543iufcL8LmjCVQdXui76kmVSbZzV2hc4R2Br1b
         DctAGbvRMHwLAHZ5WrmO31G/0bNx6JwIHwhAAh4ixxwC/znMLDp/rIY1JCHNDH/p2bqy
         vax2N7uaqa+/3cj6K8hoVtbxs9sPRACeHO27mUWHkFvxyXcmEvugP82bfrDVNOTvFFeq
         +dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202989; x=1795807789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fC+8G1FvYGo13nT/z8VOaxvmjaFeFWbWTyaE4x7H7KU=;
        b=ajjJQ1g8nEMZWVvN/3rk8oo+romA9ELpnD6ok1VIBtZ0UsAMmf+vW9V+MALx+JlVzB
         arrhboeK1Q4c33It+teZzeGW40D09RtPrep7bdDu2zs1OZSpza1qDNd0QF2tr43lm458
         RDjxqo14z5ya4VTL68j0He33PCDLgUev3ZkeDGInBypGGyKW0BCT4gdX8KFU8DndHT1K
         hp3F9ObEerJzFMwkM45U85VTtvlbDwX0xkYBsw/Ll6AJK6faE1E4Gc7V6toharRExYGU
         8TZUER4N/VuE/uDyVDp9NLUTkMJni1XXIZDnCYPVcSFBcIvrMtjhnwPBBSxqfSMHE86M
         WCNQ==
X-Forwarded-Encrypted: i=1; AL+hErH8BpcRh0p4uKlRB5doblVUaeltBWe6hLvPCwVNnEc+d1W9+ekoMx7HLQC8NkYwNA+uLGEZSZ2sDDnK16U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZT/JpRwFw5re1SYTXUBWyWgOeAgOVSblxEC3ZMwoVaeY/+hI3
	E64/9eVMl4sJHEpSSnvs5u4ceAZZCEmCEH5tskpNeMnZ5fZa1f3zRGStCD1JYuWQzIMaAaecjAO
	83goR5kO81VEjgETxisR/rYB2FjypJEc=
X-Gm-Gg: AZFdTZfhkhAANGuQef/sF6RzATvW8Q5Ggi9Oa1cQFsy9YGCjWQ7xMXH0eosjt8lD2o4
	lV0mDd+ZgkhyOofpotH+XiMasfMTlsOxLrk8Y922YkiQNG4scniBzpelsOVowsATBdwB7MoOwTo
	Hf1rjiGqFlluVHNDCTYen6GeLanR6BruflEmBjqTXGh0sX+HiSW65tNGvXk+Gewt9p6N25+NgbY
	nBjlaSl0DrrVB+poN2QYd5JCooDRL6mrQYlUOOWT6PYwAfg+FQ6u9Gq0wbOhKJy3dC3ObKcNDqW
	fhYmlwh85pl/Ov25CWjuOvXgh9TAp2rNVfpXJpw7cY/gC5gbt8ptj/zreRrXvITXtvZU4h5eJ8l
	C9qO4l9lQh7PfQwSnTFJ8Wj2PLx+73J8TgpvntKNx9p8+zT9LjEPilGjmbuQFTJ58ptHlRd5vKZ
	7lr5IbIoocBh0eew==
X-Received: by 2002:a17:907:6024:b0:c41:1e13:8891 with SMTP id
 a640c23a62f3a-c513a88b0e5mr266008966b.9.1795202989249; Fri, 20 Nov 2026
 11:29:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179432406157.994134.6897059294926012210@kernel.org> <20261115161701.2351256-1-stijncleynhens@gmail.com>
In-Reply-To: <20261115161701.2351256-1-stijncleynhens@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 20 Nov 2026 16:29:35 -0300
X-Gm-Features: Aa3M54roLAaHbrszK7dhOVz0ylLDdulRhF9t0J0W3KRLDQQsChPRJbY3Ar6o-dA
Message-ID: <CAJq09z7Jg1Y+R5xmLeE7CSUvp7dtFKi6vLifDxdL+nh8VL3FdQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: dsa: realtek: rtl8365mb: keep the neutral
 PVID in VLAN-unaware bridges
To: Stijn Cleynhens <stijncleynhens@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, netdev-bot+sashiko@kernel.org, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Luiz, this ties in with your mail. One correction first: the patch
> does not move ports without a PVID to the bridge PVID, it does the
> reverse, it keeps the neutral PVID on the ports of a VLAN-unaware
> bridge. Your main point stands though, and I tested the SVL direction
> on hardware.

Thanks Stijn for all this effort and testing.

> The switch has a port-based FID (enable mask at 0x07ac, one FID per
> port from 0x07ad). I tried it on an RTL8367S and on an RTL8367S-VB, the
> latter with the L2 entry layout from Mieczyslaw's v10:

I will check Mieczyslaw's v10 after this patch. RTL8367D doesn't have
an EFID. Without EFID, the same MAC appearing in the same VLAN for
different bridges will collide in the L2 table.

>  - The port-based FID alone changes nothing while the VLAN4k entry of
>    the VLAN a frame is classified to has IVL set. The learned key
>    stays {MAC, VID}.

Wouldn't it be {EFID, MAC, VID}? Or, for standalone ports, {0, MAC, VID}?

>  - With that VLAN4k entry in SVL, the learned key is {MAC, FID}, and
>    the FID is the one of the ingress port, not the one in the VLAN4k
>    entry.

The FID in the VLAN4k might only be related to MSTP. It is not used in
the driver yet, so I never figured out its actual purpose.

>  - A static unicast entry written as SVL with the port's FID replaces
>    the learned one in place. The roaming case from the commit message
>    passes, 10 of 10 pings, on both chips.

Great. That's what I was expecting. And does that replacement happen
even if different VLANs are involved?

>  - Multicast entries follow the port's FID as well. With an SVL entry
>    whose only member is an unused port, 0 of about 40 frames reached
>    the CPU while the ingress port had the entry's FID, and 38 (39 on
>    the VB) once I gave the port another FID.

OK.

>  - Two VLAN-unaware bridges on the RTL8367S, each with its own FID: the
>    same MAC and the same group in both give separate entries, deleting
>    the group in one bridge leaves the other's entry alone, and traffic
>    of one bridge does not hit the entry of the other.

Here I wonder how the EFID would interact with that FID. I believe
each standalone port requires its own FID, as they share the same
EFID=0. However, each bridge has its own EFID, which should be enough
to isolate entries from different bridges. But Mieczyslaw's code might
have come up with a different solution.

>  - Tagged frames, on both chips: with the VLAN4k entry of VLAN 20 in
>    SVL, a station sending in VLAN 20 is learned as {MAC, port FID} and
>    the roaming case passes, 10 of 10. With the entry in IVL as today it
>    fails, 0 of 10.

Great. We just need to avoid the same VLAN being used as SVL for one
bridge and as IVL for another.

> So for v3 I would drop patch 1, leave VLAN 0 in SVL, and:
>
>  - give each VLAN-unaware bridge its own FID and enable it on the
>    ports of the bridge while they do not filter,

And how does EFID fit into this?

>  - keep the neutral PVID on those ports, as patch 2 does now, so that
>    untagged frames are classified to a VLAN in SVL,
OK

>  - write the VID 0 FDB and MDB entries from DSA as SVL with the FID of
>    the bridge,
OK

>  - as a separate patch, write a VLAN4k entry as IVL only while one of
>    its member ports filters, and as SVL otherwise, so that tagged
>    frames in a VLAN-unaware bridge are looked up by MAC as well.

I'm not sure about that. We might need to avoid enabling the VLAN
filter if there is another VLAN-unaware bridge also using that same
VLAN (as well as avoiding adding a VLAN-unaware port to an IVL VLAN4k
entry).

> VID 0 is then no longer part of any lookup key, and multicast is
> separated per bridge by the FID. vlan_filtering_is_global is not
> needed. What remains is a VLAN that a filtering and a non-filtering
> bridge on the same switch both use: it stays in IVL.

OK

> The FID is 4 bits on the RTL8367S and 2 bits on the VB, which limits
> the number of such bridges.

There are multiple FID's in the vendor code (it is confusing). You
might be referring to:

#define    RTL8367C_PORT0_PBFID_MASK    0xF
#define    RTL8367D_PORT0_PBFID_MASK    0x3

RTL8367C uses a 4-bit PBFID. I still wonder about the relationship
between the EFID and the port-based FID defined in this register.

> Does this direction work for you? As this is no longer a small fix, I
> will send v3 for net-next, keeping the Fixes tag, unless you prefer it
> in net.

The Fixes tag is appropriate since the code is broken in this specific
situation. Let's fix it in net-next and backport it to net. With all
the expected changes, it might require manual intervention to get
merged into all stable kernels.

Best regards,

Luiz
