Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954200;
	b=eVhKXPPK7gZpBUqcx5exQBjioXv6NPcIf/1i77ls4vJ5nGanUzdtPh3uuXRxBUBRKwRM
	 q2EhTGU+83cAytqcXkk0rVVFngnU0wnC2fT7u5VnDWYV4LfSg+1wOdTIc3Vh/HchkIecd
	 n0aw+yQrujuODRiSnG6xhuueW86XYM/aPppQ1Kj5cgECH8SL69+BzaLqYIAyEdwt97yK5
	 bhlLLrxqa9MZMs4OF+p0CSAaETljTOgBKAWlXDqJwuZEH1A2uHFJ0CXO8KK2qy+rEJwuQ
	 4dPwDhkJ6x0TiTTCOY25GAtq4deD19HdmZpqNsqyNX/SJCHTpc2iCBMUocB0mewTNig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
	b=jlIlrVj1jjdPPzcOD17HK/kQJgQK/48lUmcyOXJhrnJqrnj74mcjJ8nNc2F52T63VcYV
	 PKM5P9ik64jgylay06mlpQpiYWdtD33nCJhOFl+Nn8dtjo4C8SRDdfRJuPDMRsstu65y0
	 Mli2CIwNXubbh3gzcOxQqqxVt5mJ22vqOX5fyZWk2VTEtM0VZFpHYB1ZYRAJtiZ8DyN1r
	 GOosg4IAXZ0ft0NEXgOgDg3BCFU11f9J4LVI2tuTiTOGbR0mhMHL8U5kIIp0/LYK7qn8E
	 7ll+QK21DQfuRxIseDEwkBr5ML/lLZDZ6pHlrrOB9c0EOQ8U/ahRmzge1qInGr33dEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC48606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC48606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM260i2206716
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3q13oIFHchX
	PM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=; b=PUEFdh7q5L2JYPw6JJBaFQxI/Q4
	sFzmHEq56Q7i7DCKlM+eBGQXCRALo2QecCYubDNvHctGTlp0t29rtrCt/ksnr/5v
	MYsaGrCwNt7LmrjIEzawBTBesaGCkpwbxnW9OMdlOtzRsR6B65xN5wcA1TYjTeNv
	lvp1H9CHHcxFrUxTA8y6bT/iQO3GLfcR6TTrPZOk+QAmiPz69IHcxbJ8rSYZuY14
	yvPAyZQf2z+g+EmeMCYhDgdvotkNIEvRlGd7J+d0+0Ok95giN7Lrl4QsrNYzci+E
	Ay8F4cJoZUYPPDUYjGUVg+o/we6jxKs1DNWxx2BDTD8p/yy0EZinKo8C18A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0vrx262c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efad644688so2281155ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954197; cv=none;
        d=google.com; s=arc-20260327;
        b=T1VSCLGv8UFIqEwm/8ONYE88bPgLov0Tmoe0Fv288S+5h7iSKV0fulKn2WN6LBEydO
         xJhL3ZOCGmy8l5Zf+VoPSG/D6zLFbtjyTyu8Tuq+HIUkUQ1SiSSApNkBx9YJvzvy/u1T
         ZhAb0bsgmw4YL9UG+RkTdAepy7iQlJCp5c0DjaXStUsVh/RVPkxR6u83/mOaYLmfD5io
         cQNnzRwDfGfbVIXW8YiYhiPCh/SQm8koz2Nz2UUqsrDwZV8O4CnHw+or0riGGK3LSCUy
         YKgFAAYvxhYLFmIS85x0yBybjG4/6AJXs4g0MB4wVJlZsAMFTwkdRY9WqjBtOJwr+poh
         v5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        fh=iCCESxNpUDPL9S5Gr6fjlQTtkOrI879SrO87/kZXW18=;
        b=ryijVXYhxIH7uBFNmWsHhbCOIGw599POM6Y7CYKwBgaAngA5Fox6QgbqcpnUkg1F/8
         yqCNc+ihEhWAZfVW13BAS1LRmiv/bu4B4ZlxVke9HyXAaF+5pJIGC2qJWRLcfvYPU9/W
         2AF3VeD9LSs5+9d/gQA36dypgDN8gr9h8dpjX+PkYQf12sgHg2VHJHxiAEmAEnAnkBok
         lloo0+/8oWNAKXq48dal2W/oF04IrBbnCqSOeRheRVfils/L1hNgV3cjIcdtCTdhF9S9
         DzE87iVCkoHL20RiVYtU66RtCa4qcSzVjoGnFFglhsXoGm8fQV8B4LOroHsZDpiqReFj
         UZcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954197; x=1795558997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        b=lMa3VvCySL8EhcJx6v17yA0rGEllkAlnLjI43vcdQ+x8HEkcQtt1OUI9e+8rH8O1+6
         PmyNT3puGLnkvmPJmjBVDDVhk42Z6uYlX4tNybQNtM9rMZt/TETT20Z5u7Zzf6XjkfzD
         bwUaftTBcCH5wODy2wbJbrpfztblU0sSXzNrvBmkwghRVYoNqUf1jQ1QUY0y7m+zLASJ
         u8ftiLUxT/ZNKmTjv7c9JE1g+seDN9nJPYWHC5gQzi3sKBmqMjKpqXr6JOaLbrLJpYeN
         uWRRrOPRTPX5OxgP90kPjH9L7zTyCjlCTmQPzCS2g30kVI8w4UhtNPUDnowQrjD6liRc
         gsrA==
X-Forwarded-Encrypted: i=1; AL+hErE9z8d2gB2XpdU4KIvomEi5/3tNbAA1a+bTcB2RFJn1UERGUM8GolFy751HwqX+4Cbs0HFeEwP/93moaeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++1tUXyoalkMMFRUb+GhFh4ZikGXw31ov0tTmBdlp9Ipadzv+/
	HPZKQ7kjPt9VyOLOR3n/mL72wVNjgNrPyxCQOmqdxB1Sz4MAbcLOdEGV+f2fVMhWB82zdADohx+
	KpHPMaaK8cnBZYo764EE+STRN8iQKjsNWn7PWmQdv0D1cFFU7dfXqz2SG05Yk51o2Lyr8rwpS5r
	fptWAfIeBjOwtEsTpdridxuYr1dXG/Iuouq8pp4mQ=
X-Gm-Gg: AZFdTZeWqZ80ghyxDBWMHVq1bgUBSoixpNKY/mQ3bV9vPMRZ7eEL6WLqAPkXpy/Q/rX
	XVpv0/l8tMz/rs7bzwa2enhI3eWsaszX1OUV7lxXgXKWCfJgh7NI5uk0/89aWgPtaRVtOT+QODw
	CkYz53Atc23HzkwbVEq58Z8Xmzv/2dL7k1/UuOopRDkMydOtBJEiXK/XKlVKoDzQMpMip1+GSPN
	oqMgkoEX68500kIn8PkyqrZtKp6fhkQYijRmq5U1bjx8Q/VoNY=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr668807a91.13.1794954196780;
        Tue, 17 Nov 2026 14:23:16 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr668796a91.13.1794954196341; Tue, 17 Nov 2026
 14:23:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-6-toddfreed@meta.com> <179471269695.2199510.18062590833471363525@kernel.org>
In-Reply-To: <179471269695.2199510.18062590833471363525@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:23:05 -0800
X-Gm-Features: AclHuK_fZNKIqR9h7_djkUI-3BJ-ndjBhRGAOYb0D1EyikjXTaP2ikjH-ZrZrT8
Message-ID: <CADh2yMzkbDDFt00Bnd50HPFJf9-HcKHA8BpfOikBUPHjmdZaAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 05/15] net: add METADATA_PSP dst to carry a
 psp association on an skb
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXyRgqU2fqc5xg
 qn5ZxZS1//itqZwN36GRk4d+iwvGtjKUbuY9D6YgXGwcz8kPacmu7HUXjEZfvfYtC3UOZPUaSo7
 byJr5DskGBRAsfFW712Brsc1wKU6iaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX+yFRVgHY5aAp
 IBjG9sISvCZa3IMXWhNHRbny9H75TFWKGMdFOghGtRtHWRPzvccZGVXUjHELEdY3N9hsqSouE2V
 aQj7PhVfAga8aydS7GTiF38fUrnhIwD2ATe5wwJ2PuoqwKIDfEbX/OIPIehrJh+Hwz5iDmfZxH4
 vSpauHiamL0gTq+pyUPmmq0aA9uvQpCvFPR5PfGnC7AaR3I59mb01i+TNSCwqb+l8f7jZGwxfdO
 +nGAQk8NG+DkXypB5nAkxLOagNnV7BorRJQhLajDoRKagxlPimX7c5Chq23XKAcB7wfngGNVM+f
 uo1dtQ36NeD4jONGyIkxJ51asAzrc4VdoSvVrYnTepW9p4eyWiHkJN+/PlFiUrSM0mUbTAhQwU9
 C52mQ2BPh/tR6M4siFsmONi1KfXI8q+sQUT60gVFeYqK9/DO0NjqiMyoQ8O9TkfJCAXf0Wpgchg
 by3b5Ici+adarbD6Egw==
X-Authority-Analysis: v=2.4 cv=duNOmFg4 c=1 sm=1 tr=0 ts=6afcd3d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=27JUocoGZ6S1wOk3j1gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lhAA8U4C7gQAHef1ab6i6MMfUI3yQVjF
X-Proofpoint-ORIG-GUID: lhAA8U4C7gQAHef1ab6i6MMfUI3yQVjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> The commit message says this re-check handles the case where "the psp
> device may have been unregistered while the packet was queued, and its
> keys deleted". Does that still hold for skbs that get requeued?
>
> ...
>
> Can this hand the NIC the id of a DEK that has already been destroyed, and
> that may have been reused for another association? psp_xmit_md() would
> catch the psd mismatch, but it never runs again for this skb.
>
> ...
>
> The socket path through psp_validate_xmit() was already exposed in the same
> way before this patch. The new METADATA_PSP path, however, depends on this
> re-check to handle the unregister case.

This is true, the checks do not handle skbs that get requeued.

As noted, packets of a psp socket have the same gap today with
psp_validate_xmit().
I'll send a separate Fix to net that covers both. v2 will narrow the
commit message
and mention this gap explicitly.

-Todd
