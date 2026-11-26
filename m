Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682809;
	b=ObtGJODG0Y25OGIEYcmU6pACTumWG6dKPkxqlSuuCIMZm4UXjMfhdW/M3YCSRVenyyjp
	 i58ZbYGR6ycht7EfyseeOiiIvsn2YnrvY/hxhx4dJUKhoXqka9qRZBJ63tysG0+h/fabD
	 u0tS7aoJZMRUBT9YZl2g+pdeVZgVWXwTqZMSrX5o25eVx2hySA9/M1lXJ3nopRatCivBH
	 qrwBSz59rRbRWKFZmSIrhg7QaaN30FmKb0qQP/APUZVqVVt6jIZKy/JJGcT2napOevsio
	 ZjhuL5ETOPda5ZvSrFwc1bTrPiqUz7pXYaM3gumUqL8FxjTt11S/Cqp41FtVULa1HVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682809;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=G4HVNP0skCwzZbflAb39EQgistRgxhEW85b8K9UrTlQ=;
	b=DgWlJh//6at5efYUXQdignCbm7g3LPpjpzzn79TAYQ1RRj2EOqe3vtBafoh4PuqNIXCc
	 0NBuPCp9oyiTLWrbk6iyxetfOfc57Kn6m0a9rxJy6MedVGbsvi9aVaQnjjSTgiFy4eiA9
	 U8FhisAhpKRI+pD4qIxT721Tcm9UTDXqGuBJYt6JRKNKuiKnVo3cDaULFZHHL8lPRUKxn
	 Q8JqrIjfyKkacu+LFoqX9SMAmxwAZMOJIddnkD34TYp6ZgXyqZG3ZTcl1OiYleWIdvAiX
	 6V+gvc0pScBIcKelwmVMdz1TUhdnmM1OhBdVpDdJNER5VzlXCJKZiiBnfcx95RXpAoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=cSqO5Kvn;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C077606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C077606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=cSqO5Kvn
DKIM2-Signature:  i=1; m=1; t=1795682806;
 mf=PGVmYXVsdEBnbXguZGU+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:AJ/b+ynKf64DiYTwHF9iGRpeyPJ0
   EwJ2leG5AdFNWxU6EfXz5SWSkQP6d5EYYuJcl4mkbfJBrTG+s1yPgraNU8m+udsPYmZSsNfviD1
   oov/+Y2yz87KBpopgkh91QWrMwRu+4ylWD4/lMFEhVq3K95qEIU4+C/rekWk4UDswIE6YVHZPUq
   a6AeZBbEI1ewk88rORlHYJm2pZgOlQWQewZDBaI3hk7o9OMlsaknt/LX0d16g8mcyAVFEQ0iKWm
   p8I/PNFlS8BIa+bIuTiM+aPmpbigmJTSH4yfLkWC4977GBtvjTz5Zn9ddj+NDA53olRkgSJQ96H
   /AzbB2ugmg/uyg==;
Message-Instance:  m=1;
 h=sha256:
   iVlx1IvgkXec1kzopD5uEnZlA58XC71FgFyy7Mb806Y=:
   sCqzTSh7fuc4wToJSBJB6hKHl0yy2SKg0IHlkZp2T/E=,
  sha512:
   y8/oCLqeLcIx/83s8640mQGoueUMKZFUfCkswlrojJe10h2evIDgFIa2Ont76Zst4VEmRwnJHE/qlkbrmTwPeg==:
   lBUTILEgcDcfWqHkhiITKo1ljc3cZR20lOfMI2Gemj+3MEh85xepZJF1Q74SWwBxe7aKNgI0kqrR3PzcXxqTtQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795682802; x=1796287602; i=efault@gmx.de;
	bh=G4HVNP0skCwzZbflAb39EQgistRgxhEW85b8K9UrTlQ=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cSqO5KvniAn0YXxV6HRtOQduMruRm+klI4SS/Plk3eMCyK5W9Z2mKjOTy6IcYHhj
	 CLQvn794wQBBi3e1MlGb1IR2jGR/aeq/TMnpkY9JPe7aSMf4c/m2sNCDvVh+BWIR2
	 wmca8dKOo54BFWEKBWVsJmq7d0+cJ4P3SafH1IMvXgDjDdFgXZca/afVJI341NCsJ
	 sPI7c6e95j+pL3fyQkvmaOVQwkrs+hNDCZRMu21QSKvN8O44n/bq2sAefmktnJnKF
	 ek+jwXCl+LIYFTTY2FKZXFN9jLTIXtVoWyk8CZAZlV6Fkv2BM33R05smC3YPXgc3W
	 KJIOwWcigjO+mkxO6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9gE-1xklGI1ZiG-003Cab; Thu, 26
 Nov 2026 09:46:42 +0100
Message-ID: <800600aa055a8a25b63d06ea6ce2639b9e082e6a.camel@gmx.de>
Subject: Re: REGRESSION - 2652aca460dc ("drm/nouveau/kms/nv50-: Enable
 atomic modesetting by default")
From: Mike Galbraith <efault@gmx.de>
To: lyude@redhat.com
Cc: lkml <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
Date: Thu, 26 Nov 2026 09:46:41 +0100
In-Reply-To: <12b703de63d82e893cc3d7a098f2d62fc2f0ae2f.camel@gmx.de>
References: <96444f8e0155d34c7a07fd5cc67ed87784bedd38.camel@gmx.de>
		 <8d952f5fa8d93c5d5f92292b5af203e83e5de3ae.camel@redhat.com>
	 <12b703de63d82e893cc3d7a098f2d62fc2f0ae2f.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Provags-ID: V03:K1:xJPd+dAD9blUy6XLmhPxz6iRDyH+G9Tc6LAgVsKDfkypYVtsyuu
 yeYLklWbnar9IqhdI/x295FUDUBPXemFamE6WjzxEv+eZUlNEeryGBGh1hsTCqx1DQpi6C8
 CUqVMwkglaOagFh24M7mNCcfZ8LKdxKF/BNm4Bi0CxwfReUTYBcePbE5oLWBHVXy4igb92Z
 i2bBCO3EP6W9oF0fZH+Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x1nyXKcN6zw=;Y4EMtwSHiAJRxLKXOGPsW7Erd5M
 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

On Wed, 2026-11-25 at 03:31 +0100, Mike Galbraith wrote:
> On Tue, 2026-11-24 at 18:02 -0500, lyude@redhat.com=C2=A0wrote:
> >=20
> > Hi - do you think you could paste the entire dmesg from after when the
> > bug happens? There aren't really errors here besides the MMIO write
> > (which isn't unexpected)
>=20
> I just booted with nouveau.atomic=3D1 and ssh'd in from lappy, and what
> you saw is all there is from nouveau.=C2=A0 We do take the device->card_t=
ype
> > =3D NV_50 branch, there's no warning, box silently becomes headless.

FWIW, I put a dev_warn() there, ->card_type of GTX980 is GM100.

	-Mike
