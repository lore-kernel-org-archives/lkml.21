Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019491;
	b=2mDndP2VLunpV4CSelsratcKT98DLrrrFImJqujyEgJ+z/ngHZoAzzHVVO0lLewpwcft
	 QJcSxg8Y5O0W222nQGKo7G7ofGM/YIHwsWzM1zIzN6YRZ2oToau70ASDJbJ2psHmzgAqm
	 qW5L6yeAWmfvUKhokWqv2L926pvhLSRIdEk0mJPexs6GP5d5pPEmP/zCoJyirglaNljn5
	 aJOfz6qcaqDQoqdFNizakVgNHyAxypzXZPE9X+NHd/eLJX9X7L5vxp7CVFCVSgwvatOyy
	 kUR3UyEPfr89hSjP4f4usZ8agOyHU9uJFD6qiqUhOMphk0y4miB6muyVlLXOinab3dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019491;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=Pe9H5AXbuyN8TunNp74Ob+dygjXbIr28w0LaWNA7B4M=;
	b=1WUElkxOy0IoMEtqLYj2iHPPPCCQgA1MQXPfWS7n27s5v18hMG7kWYHsWZZfBIp010jK
	 6Z0jMk8ocoGGrHlXGdWuXK6kkfhXMuD7QpGdQmXBPDbrjwE2kt4f4OTM4bXE4ZFMlQZfG
	 PEeZZ+julRvPqvFSsaZoiNaRiMLdApQ12ynqSQef+13QzNN3oOXhShhg8beyqLCMee3jq
	 l3fSHCf6CrEhJ82cwBqUc1SDToZFw2eQ/CKpvsuwfigaODYvdc4Su6HkrtMRYr6SuhIzk
	 zQJ4J7Xq0al3LgWPigEuXrmSVVTql7y+oVrK5YRM1bjPnC73H4Wl+QWl1yAKtQCK82Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JJgVQXKP;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7B606A7C8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB7B606A7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JJgVQXKP
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso829994a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019490; x=1795624290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pe9H5AXbuyN8TunNp74Ob+dygjXbIr28w0LaWNA7B4M=;
        b=OEiJUKt9AcOJ5LpO6LKk4gu+tBTpN66Jd9Omi18IbNEOtRyEn7LiKHo7u5ZObOziYG
         MM5haYt2S+Gbp3i3zmcxMIrI0n3Gl1XgVupXiMS4GQJ1JJsc2Mt8OVDGX3u9Nm48pk9k
         5e5ubK2UfnbHfxTHyP+YaRhB6o2f+ABPnUAvRtug0Jru5zts7LUhUgYGHZdKml82owbT
         R8qbnqKt5DOEBxfF09CNSInfek9VspT2C4u1pdr5y87YREyhL2AIZQ4i3B7nuNqbJBBf
         5sOUmRUfgn37Xf8JBQ6ffG3wBqz//eZym0WCWeDwnJOEPGPbPuJsWIuJEQJ5B32GfAtq
         x2qw==
X-Forwarded-Encrypted: i=1; AL+hErHmjjkEb1am9KsYKKiq9vIDv3J1tjWm3rjt9QYznUTaq3BlOqiQKXMZDSdvUZO/og/WZhdBVrN8SGEc5Tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iUzMS/+aVpZx/XahXrGvlH9YuRTU37CB4b+SF0u+KOeOhzTPW
	MfzmV3EQGkmr3HJQhwLzYrMGQ0afj1FtJxoxn8wHd3U0IW8575eHdzMS1x2IncIWWKeZU5miy85
	9nWxnjIZwfkfuva4wi+g+oV7RTYryCnx/1k+gDn86WTKBTW4LJYIFiRsKx/4NwiZZ/ljGr31meC
	Mb8wAE/GfC20oGo+zJCwD8RYXaut9U043ja8QumySxZUtQcS7CamFjL+ee5oXcaps2KWURf5AG8
	EXZk5xiLfaX19eT
X-Gm-Gg: AZFdTZeoPhhHRmQp0cz/KvWZWIQayq7E7c2KM6926opVx0J55CWKhcLualot6nn6zvz
	EIT8Q5X/PyKNDmic2LuWIbyaaLLcVIwpoO0pYRw7J/rMhlT3KPHJgMSsBMGObdbkix0XaMsw5TY
	VoV0EkdtrXKifKoP/VUg2pfciO8mX0kjBKA3iZ7Ecw1hJFwlyWJT/fbr6ij3y4DMADsleKUB5Jr
	74zKuWpcCz5IzcuvKWitYUDvemw+t1im4TnBHWjqnxSvVwOufUA+p7hqAO8WPyoN0ZwgKQRrrSg
	v5eWwpYuEsKzCNAzE5qKb2MPYlikQJdsObMZm+OrcCDVqIMWiTFOompksLVqeHfx+ipIBrCUb6z
	l7+SiRv5cReupby+IOYPK5QMX0zUvPO6+6l0Wu2rlXIipp1xoAnMOVnlvfst+TlWzd71jU++ILG
	uezBjTezXM4M7oVQuxFBEY1swdaSIb0C5SXSg=
X-Received: by 2002:a17:90b:2784:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b3d07d5206mr2906600a91.48.1795019489492;
        Wed, 18 Nov 2026 08:31:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1cb9989sm772739a91.1.2026.11.18.08.31.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:31:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so1599689a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795019487; x=1795624287; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pe9H5AXbuyN8TunNp74Ob+dygjXbIr28w0LaWNA7B4M=;
        b=JJgVQXKPn6qaRbv4pv/KGLL0NODu1/oqt8qiKeoW3ZpXObLWEnvh7oZO1YKGsG5ns0
         GTd7VKJCtc84ekaev92xBpgCkocrbcj54HcakNXL2w8UGqEgqAJO5tK4WFxJEMOwbXvW
         yuNrkWBU7J228luKo34Jmt7tqkoDo8EZ9RQP8=
X-Forwarded-Encrypted: i=1; AL+hErHg3tRqntotpnnllAP5zlvrOF+P20rli1VNrg2obg4BACKOJnU3EwoLngqDSekdPnPNos1AO+Eepd6+geg=@vger.kernel.org
X-Received: by 2002:a05:6402:e8b:b0:6b8:e848:d004 with SMTP id 4fb4d7f45d1cf-6b8e848d2cdmr663891a12.29.1795019487111;
        Wed, 18 Nov 2026 08:31:27 -0800 (PST)
X-Received: by 2002:a05:6402:e8b:b0:6b8:e848:d004 with SMTP id
 4fb4d7f45d1cf-6b8e848d2cdmr663860a12.29.1795019486624; Wed, 18 Nov 2026
 08:31:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-uet-ib-core-v3-0-3e7e7ffed2e9@broadcom.com>
 <20261116143656.GA34010@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>
 <20261116144830.GN2532299@ziepe.ca> <20261116152652.GA8275@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>
 <20261116160344.GB2299285@ziepe.ca>
In-Reply-To: <20261116160344.GB2299285@ziepe.ca>
From: Eric Davis <eric.davis@broadcom.com>
Date: Wed, 18 Nov 2026 10:30:57 -0600
X-Gm-Features: AclHuK9kYIJ3_8TYVRq06_Pq1lxr1K8Bw7Nr_HFc9nRDGE1a8scxGMz9UJ2JZks
Message-ID: <CAMouMYJ2y=NgDw60o8nCKq+yk26Mm4VRq=w7_F+Df4jU-c0CbA@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 00/13] RDMA/core: Ultra Ethernet transport verbs
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Michael Margolin <mrgolin@amazon.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ecf69c06608f8a6e"

--000000000000ecf69c06608f8a6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:03=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Mon, Nov 16, 2026 at 03:26:52PM +0000, Michael Margolin wrote:
> > On Mon, Nov 16, 2026 at 10:48:30AM -0400, Jason Gunthorpe wrote:
> > > On Mon, Nov 16, 2026 at 02:36:56PM +0000, Michael Margolin wrote:
> > > > On Mon, Nov 09, 2026 at 08:00:33PM -0800, Eric Davis wrote:
> > > > > Ultra Ethernet defines a reliable unconnected transport. A queue =
pair
> > > > > sends to any peer in its job without a connection, incoming traff=
ic is
> > > > > demultiplexed on a JobID rather than on a connection, and what a =
device
> > > > > orders is far weaker than IB or RoCE and varies between devices. =
None of
> > > > > that has a home in the current uverbs ABI.
> > > > >
> > > > > This series adds the generic half. The objects, methods, and attr=
ibutes
> > > > > any UET device implements. No driver is part of it, though two al=
ready
> > > > > exist against this ABI. A reference device model that implements =
all of
> > > > > it, and HPE's Slingshot driver implementing a large subset. That =
is the
> > > > > argument for ib_core carrying this. What is device specific shoul=
d come
> > > > > from private interfaces per vendor.
> > > >
> > > > Hey Eric,
> > > >
> > > > Thanks for posting this. EFA's SRD is also a reliable unconnected
> > > > transport (one QP reaches any peer, delivery isn't ordered), so we
> > > > looked at the series as a possible second implementor of IB_QPT_RU
> > > > that isn't a UET device. Other vendors might also want to support
> > > > this interface in the future.
> > >
> > > I'm not sure about this. If you have exactly UET programming
> > > semantics, including the job, then sure.
> > >
> > > But squeezing some EFA specific thing that doesn't follow the spec
> > > isn't a good way to build the APIs.. Persumably EFA has its own
> > > job-like mechanism for security that is different?
> > >
> >
> > I see your point about trying to fit an API to a different use case it'=
s
> > not meant for, but I don't think this is the case here. EFA doesn't hav=
e
> > a job-like mechanism, isolation is handled by the network, so jobs just
> > don't apply there.
>
> That sounds like you are saying you have a job for the entire
> node. Which isn't the UET model at all.
>
> I haven't looked at these patches, but I understood job should come
> from outside verbs as it is something an external entitiy is creating
> and then sharing across alot of processes.
>
> If so then EFA could still have a singleton job object and that could
> be the deviation. One job only, and the job doesn't actually do
> anything to limit access.
>
> Jason

In the UET spec v1.1, Sean Hefty and I contributed a new section
defining the Verbs mapping over UET (if you're curious, it complements
this patch series and is a short read).

One key design point for RU QPs is that we tried to separate them from
the transport. Specifically the GID type selects the transport and an
RU QP should work over any transport that supports reliable
unconnected. Of course each supported transport may require different
attributes to come from the QP configuration. I'm totally fine with
making some attributes optional and requiring the provider driver to
verify the given attributes.

Based on Michael's porting effort, minor tweaks may be needed in some
cases. I will follow up in each of those patch threads.

Curious what others think about this direction...?

- eric

--000000000000ecf69c06608f8a6e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
THSLCC9N61nO6/woOMp7U0lttATSMIeibGPNnU8AizWyI5DxXKkIG5jv1EosjdJwBsJ8ZntvpfIx
+KplEkYfqN7Sy+7LOzXXkl5KhTkDELRuftv+sahPNzVHW1cJgj0HjMb1sCrFjzcAuO27JA4geQXW
cl+gyZDv53xtHnMSNmIoqDEINo4yoSHYPGK+cTtGC4K9a6yCXdP2zyLkkSQtZ+hEUOru4dQ1gIZf
4bWVHOILQGaMbqVAVA1OrjpUNGktgz0CAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
ZXJpYy5kYXZpc0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFIjgxJwMJZ5pkTAB1796PUvJ+W7DMA0GCSqG
SIb3DQEBCwUAA4ICAQCM/INVouXcD/gHdJNCPtF31BpLUwHGTj4BlO4083w8xuxt0iSjyb0EKv7S
LBz29Dw9scSTMRS/sY9dotjJ03vVvzceiGB4FbMIZNSKHTy1PTNu0oZR7TwhBEEZHC4RtST9S2hU
MvDagOAWRM/56PG6FH2i7dnhwtcnsBX8CMeVJQc6SB21LuxJVqgULli/kbrkr1DBVMh2f7oCFHVu
0VgtvRtACeQVi7ny8wspKNV/WXN2IqT06c0vtUmFUPkidlgGxMzYCfQXbXcE3YvA7+xYqmCY0zdQ
f/ira3VJoAytznhfRSBRV4gmlChdSg8yoaM6LHNE7igDDqhVFT2QCqkRkIcPOCQYxNE4kViiDKKo
3VFnREnYmLzRbJkdGY4X3m+N7HOU8R99Zeatx6hN02eJQH1vZ1J9cH4SqxuqDxKi05n3SGE7J4Wc
oNsgfaIDL28JX+2JBG+gKr/vvjocja5y9G43gvIOs9yEzGBt91FCuuwPedXIIREUcqJtq6+MOvAq
ZMEsct9jQXibihTD7z9wLTIkXqOHumCc6f53zhsQCRofr8m7Tm0YrckGCHd0BowU12A6oVax5xEQ
6j1hyszkhFPrlLKAlaFU7VuIwlcjKvN9XYrmOfXfTnYoVV6f1IDwhgbtJNlKnJksqoCzfsbAVd0e
usA704DOznTCfAYJqjGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDFfq
Ldxf930IzIe8izANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg2jxXwaXe/XLIE90o
/A1U6oBeCjoDtbi97IXABIWneoswGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMTE4MTYzMTI3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAyM2CNkeFL8hAMH+hCOzSkbY2Z/uLB+AbeI+BMwGsRKH9C/yqlVds
zIJ+cFR/k2rj6T8tlZxc7JiAdbvtse+v5KncBt5r7BbkrkKEy4soAMoc9Eh+Ll7auG7ONnD9+q0X
2yLJkKEBu7necKSc6Xwiz4p+Pk07fhWJN1OCA+1T15dCnulf15585JobYf8QtMaIv2Ej0oFi9GRw
U0DWGlV5uNvNubho5umoiAq9/4snYivXmig+LX+jotdRsFm9j2N79BOTvPX2QLf1+Hnh5TXr9wPX
QkFAmbHZhtx8OaDjPEWiqWNKag1uXlIXFHRjEt8kuKHoxZnxGnOk3j1ix8ye8Q==
--000000000000ecf69c06608f8a6e--
