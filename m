Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573899;
	b=cobhgQsGFdCk5CBZ8Rhy2DZRadUM03N8hTWIJCXKyGERyjxzJ97TKyBCkRqU8c9fALkr
	 iU4Lfx1+MFeVplY3eczOvIsm+Z8BwFNaehPdQBtnrC86qYRNl6GujbSTMNr6KnG4Pa/si
	 VMIwixcPnbdcVoculiZRq/W3itQE7Yli/p8nDcJSqWUrEU5IK/AJkAJMU5hiMx3R3uHno
	 A2lWe0Il0WuB40BGB2QwRLB7MwoOpL7H4HU8nD98WTuDxBQOFGUl03S93IlVnkjFq0HFF
	 18TlKgn8qRz7bdiVssplAqQZeURywFblAXLi0WJEauT0AtnSTaYGSH4ctO0CEnIjIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573899;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=fK4VOv0Is+GngauzxrSbP7h0CFQV+lYc96naE7k5Np4=;
	b=EwCSHGp5wF6NoLLeWB58KaFgK7IQT9UuGHvzzhNQKp1fT9gIrnTcNT4dXYb38A9V+CjW
	 c/W98zu/FrhHpHUNrw600vfe4PmXWYuZ4mI7YL71gxKn5PGctQ3J1U9my3yaSMiKf5xgb
	 fADV+R4RYudokhDYzNPjBBsJyHx2QLXtA7JQkrhEi0ZwSHLhv0aSh+DpXboFnfnCOlJiN
	 e41AhKLufWuYKemL43wzQNEbrDUZ1i90hpI2GIvLLDG0oZIhLMnRWMbBCI6TlyxAXR4lp
	 ujd7Mv0BjTiQCLJAXXUO3JoYIJcKvc0jxnidOrco4xAo3mHlsv61J3+G58rngLMtkIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=bsFyF5z0;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4F4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=bsFyF5z0
DKIM2-Signature:  i=1; m=1; t=1795573896;
 mf=PGVmYXVsdEBnbXguZGU+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:dvcdVkUWRSrNDr6lBOntiZm79YdE
   nAAcf/hWQB5P9e+4gGaIBME59s+0BbrUIZ6B1XR75SDy8a5fe4e9D1wuMDyiNWA8JsJzvdDemOo
   gFGFU5sWtbQwz0V/UJ2+2R25sMZs6QvSQRt0Ihw+ZcgGlidNXthT0gBzWys9oQwaE6hJtAWZmL3
   hHSQngs8l5/crmbgz3pI9/jVrShgWjAcoCfoK+94nrSvfOk8nmmqu2tNZyVCSA//mQlY4yHTkEK
   wkm0TboRmi4b3bWRJQ6Qwt97wGkl0ZAVDP5EQn3id2QC9U9ZYhgI/lk5sxFNwTkAmbthL+PYIhY
   DzRF5WzjQi8WHA==;
Message-Instance:  m=1;
 h=sha256:
   u21FUT4gRVp0Q1Y7milP9dMaVX8sZ6JlWKjashqFwy8=:
   Yzpds6035DmXVCpSLJ0N/Q82/qPhgGjr94jSpP3grVA=,
  sha512:
   X/5H8ec9mVg+mGuuD4rYn3Pc/nHxICuundJP2NFp4q5WXUrUErQOZ1lI7gMEfWe8Elrhhf5Y/gVU0hp9pXK8wA==:
   EjFWJs1/oWrcmlPfT2bJzS1BGTSeGD/d8DZBfOZipnUB2m3/ydEy8wnwzTAFzMHWhjGDMGK3WYDljclgz4iaiw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795573892; x=1796178692; i=efault@gmx.de;
	bh=fK4VOv0Is+GngauzxrSbP7h0CFQV+lYc96naE7k5Np4=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bsFyF5z07HgpturD+iTbKuqB6Y1g53hp6KnpGvn60wodTlLsadCavDaZsz+wFukC
	 ooWSdZlyueqU9i+wfKLvJnFzaaYXivbyJTdwnP3fb9yOK7EVF+oap42PYVOqv/Nji
	 kambt97qmWvr6HgjZmLRe/m2DVlvYozrpSsT8wCx+bZwV2cTehEjz/XP+uOFLgIMc
	 RDQghopoDQtAfI24qAkR+dm4Tgd6IJko4dCGLg+EPgf3BuCQ5gaX0g6aaNxJZSDqk
	 eCfKMkTUhoTOwPKZJED2wn5IuXdn+yYrsE0e+HSFxi/6s9WhNWqKc3aJ4zjJLZXnj
	 nNIM+uGrnZGx72ednQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwwdf-1yTFIF0FyN-00rCDQ; Wed, 25
 Nov 2026 03:31:32 +0100
Message-ID: <12b703de63d82e893cc3d7a098f2d62fc2f0ae2f.camel@gmx.de>
Subject: Re: REGRESSION - 2652aca460dc ("drm/nouveau/kms/nv50-: Enable
 atomic modesetting by default")
From: Mike Galbraith <efault@gmx.de>
To: lyude@redhat.com
Cc: lkml <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
Date: Wed, 25 Nov 2026 03:31:31 +0100
In-Reply-To: <8d952f5fa8d93c5d5f92292b5af203e83e5de3ae.camel@redhat.com>
References: <96444f8e0155d34c7a07fd5cc67ed87784bedd38.camel@gmx.de>
	 <8d952f5fa8d93c5d5f92292b5af203e83e5de3ae.camel@redhat.com>
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
X-Provags-ID: V03:K1:1AozzJ+vZfqJ7mOEi7+hkpzKWqXQ3FVK4pJLBRMWxHbgUdUQE2U
 qxqloCr3eYzxR7R1h/BK7IrVtQnQ4K/0Hz5Nm4rKlmjUSw9IK7GV0/UUi5ckRfWB/fawPky
 hxozBrZOr/3C6Hsf5At9Ybr0MWAxwt3gOWNvMRRM13qJweU10rvNvEVJq8QmUDq+1k4gemh
 aOYa+AeXUm5o2SL4bCVEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sWfb/+EH/zY=;f8A9YV7PS8gE+M8Q8CzUPSkLH+8
 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
 zZx8gZu1OJj4ACva4N631iuLSlQ==

On Tue, 2026-11-24 at 18:02 -0500, lyude@redhat.com wrote:
>=20
> Hi - do you think you could paste the entire dmesg from after when the
> bug happens? There aren't really errors here besides the MMIO write
> (which isn't unexpected)

I just booted with nouveau.atomic=3D1 and ssh'd in from lappy, and what
you saw is all there is from nouveau.  We do take the device->card_type
>=3D NV_50 branch, there's no warning, box silently becomes headless.

I can send the entire dmesg output if you want it.

	-Mike
