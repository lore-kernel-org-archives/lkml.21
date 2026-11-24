Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526198;
	b=0Bfw/pwtPhW6BOsvMqrDs1BpxX15z1zl1WaybNBbNBhvC94X3mQ7OOBRh2gdO4jnFeF7
	 E/3oGe/pb31jsvlSa88uyW9K/exlSbpy42OomeU/G/nF90eEtxJF3EmJLz4armOhoUU5w
	 IyqPNnwdKjO1dCabWRi/mJBM+U3N/yjL3FI9LQ/EPpgS16lUDhYIrfeqSYmZMCWWrju3t
	 MCFuzZlo8J8n0FkfN7b8U78TjYshz7iRAjJ+bRYD7BODESS948amjtH2u0fS59zMcRJit
	 3VyGtjcrSw0ded+0yZ5ZFwlZ0lgX2fEFSrWe4o4ki9EsDFkWDiXI/23O3UJw3Dm03kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526198;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Subject:From:To:Cc:Date:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=M2tf0WK90Fb41ep/BqH4RXyLgQsKzy5Zb+KyB3RNuIc=;
	b=eqr+RPPAowuLaces5yJeSZzWH+V/HxmuEx/MwCdYTBbxmYanRiwLgYUoxZBXEL0RIsnH
	 mdNailG2IigRVCIzAkqjIsJO0ypajcmHLiV+nU+zjDWJLlvuEPUra4fvCafhAAby5vCAN
	 7iCY6Lhhrocp6Z/NR0zfbcpcuKgeIQlx13HI+2n+QlUjENfz/8vwc/yHiOuClqsSw1QaT
	 qEMhEDiJEjmeEHcxd32nFjFQt8qGAu4akfsEznmgeGSvHrHggjBZxRKl46ZLqLmv/YBlx
	 TDRALIL++WcvXn8tCk8HVFARZdpIUkcugcuRU5dvhVR+cns3XdkLzSWqwwdeLG97p2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=C9GmaUPu;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B575C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=C9GmaUPu
DKIM2-Signature:  i=1; m=1; t=1795526195;
 mf=PGVmYXVsdEBnbXguZGU+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:aLRlArFr6WbYgGHf4k1ATvtlur5V
   yScESPAZFo1Bj1wLqqLI/5Lqu3WpQzmOqBswrcDqdASkyCPR5ynq//G6MIUTqxazRzpVa35Brpy
   Lys2ZhEtCUKd43EsPXXp2ggULGDMdZJq2s3dY/bKde2Aq6TUprA5ZY05qeO64KtUpoLlYTK6gCc
   Y30rt+aWxAeBkU+ze8mQJF6SHLW3ZGZ+glIQnag3c8LldiH20KdM0+vOh4PHQLSdLHnQW86jjrP
   Bd0R+xXyO5Ckqq6W+SjtMph6DApyFZv+MmcsDWm4567sVAVUyMWjNMHlp8mFsB8Me7ubWxXxAZ+
   sJDB4vWMc3sL9w==;
Message-Instance:  m=1;
 h=sha256:
   fJHC0RNPyhw+utRSI355mfZI13UmTw1esEsQVbGcmzE=:
   httWqa/WKbBvKEy6/kemvMxSOTXgb9FztdXMm4k0v40=,
  sha512:
   /P/ri5kLTYh7BzQh5khEn63lsoQspMur3DQjvTaU16jbCNak93b88ctYt/7lVEo7uT8WVuz7nvH4VEoFcUZEYw==:
   A+YeaTF2UGM5p+BAnNNHYsJ+ojXe6BZXpwLdFLWb9ABNoJECwdmX3hvnKR5U+GL9JdwToeF9Lu1mUpHKtWsA2w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795526195; x=1796130995; i=efault@gmx.de;
	bh=M2tf0WK90Fb41ep/BqH4RXyLgQsKzy5Zb+KyB3RNuIc=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=C9GmaUPuK7x01v61BJlIH2bFBx8pAwg2a/fxuthlmdeKr17qNgMKtK2TQEynslba
	 dubnEQii8tm2FyfUZawbLtN/R+GOMon6Z1YPO+miSoNTwbePdFa1nGXQxpTwaW/a4
	 iYDiGxk3dnbuTiXDzZ+CY8D5PZj7nVaXWR5v0jbODNDjdTPwNqFcgyiJqC+RnRiIu
	 ZcuBkadm2Lpm2o9gn6EpaFD+ErSyPjstdTCEqDoVNbRLAybGwGgm8YUrhbE0vqyru
	 mUsTb79luYgGGj8M8bsn9+XNAgqnCAvxboElBaG228+PJpeQrmywsOiDuI0Nz/goI
	 uYAIK0T1ZrpG0DfTuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUnp-1ySuHi0TxR-00yZnK; Tue, 24
 Nov 2026 14:16:35 +0100
Message-ID: <96444f8e0155d34c7a07fd5cc67ed87784bedd38.camel@gmx.de>
Subject: REGRESSION - 2652aca460dc ("drm/nouveau/kms/nv50-: Enable atomic
 modesetting by default")
From: Mike Galbraith <efault@gmx.de>
To: Lyude Paul <lyude@redhat.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
Date: Tue, 24 Nov 2026 14:16:34 +0100
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
X-Provags-ID: V03:K1:eM2E15oD1aZHJSQG22HlzYtyCymRQWohFg+nc21zvGslezK10LC
 8tvgfVRTe+q08DK2b+VTRLXX1Bve6ojtFD6wosh6JuEIEzmtqzYBrl77ZSNrx9Hcxl3S+x2
 8dnnlTIgEZONcAW48SsU33U1yHJXTb+l+tzO+5PGeFKzXi5saHIXQLhxWzrk8YH/s05k3kJ
 8RIle5nWU3S/Xg3ATI7qQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wXjiruyoBLs=;WBtWguY/SXWHNSQGEltlM/Xr/ox
 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


In said commit, you say...

    Now that we've protected against breaking things for chipsets where ato=
mic
    isn't supported (<nv50) - let's enable it by default on generations of
    hardware that support it. We'll leave the module parameter around for t=
he
    time being, as turning it off may be helpful in the possibility that we=
 hit
    regressions.

My now a tad long in the tooth desktop box regressed, symptom being an
apparently bricked GTX980.  It bricks instantly at login when starting
a plasma6 wayland session.  Plasma6 X11 or iceWM (et al?) sessions work
fine.  nouveau.atomic=3D0 makes GTX980 wayland agnostic again.

[    2.846347] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    2.928383] nouveau 0000:01:00.0: bios: version 84.04.1f.00.02
[    2.930480] nouveau 0000:01:00.0: pmu: firmware unavailable
[    2.935007] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    2.935270] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    2.935288] nouveau 0000:01:00.0: bus: MMIO write of 8000017d FAULT at 1=
0eb14 [ PRIVRING ]
[    3.002282] nouveau 0000:01:00.0: drm: VRAM: 4096 MiB
[    3.002287] nouveau 0000:01:00.0: drm: GART: 1048576 MiB
[    3.002291] nouveau 0000:01:00.0: drm: TMDS table version 2.0
[    3.003475] nouveau 0000:01:00.0: drm: MM: using COPY for buffer copies
[    3.069569] [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on minor 0
[    3.104139] fbcon: nouveaudrmfb (fb0) is primary device
[    3.155613] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer d=
evice

	-Mike
