Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118823;
	b=AORMvKtfpBm96aA79NFzOPH3HB8O/bwpkK77L/5jQU+HgIbP125xfDnueiGUmofZmDKG
	 MxPo5PNKuTc6wsgWq/T5aa3B7ueyB3/br2hJBSUsEoVYd9hKxTh4t96dxeVW2sDp9rUVk
	 nv0+Mkm5IHFvWo2Xf1JMiGUY/Hgtrku5r8m9DixoYJ4fY1g6kRu9HoKxOkzoYR+eF9IDs
	 uishe+K7o0n9imExXx5zgmYHSbpLT8c4hcry2Pq6Teu8MKoDnsfp93rswKUHLwmHtp9Fp
	 PcJ48vw5ZgaAZG/cTtPruWqSk2x4RWdAmRF6Z4MdJimpQ+s0r8nVsBxZidc5BEpDXjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JE65ESt/gGhAnJwqKYj0Id/abPPd8MJA3QlWIIkVZhs=;
	b=oBzUXZZJmebi8CEKIObE5xg/cBDO0MGTSZuct/o+BbAyaylGcxkUnrE+5UnigzEbtGR3
	 uZ9i3h9ejFzZfq7lGVhSYgIjBZYl5jGaD49kt/gKbfEwwUKnM4HuWR2WqvtMrMdZtlS3T
	 dzDGJCVqfA9XqMK5p3Co9rUAPCrjFhMp8vZ/KQGHGPuxodOUXtzuo8Es5a8+QA3ormf3H
	 7mYKLoc38aX9Biy7oAfVCouEKmlcEtfoyMRw4XIv4IXG3ZGRfPpp4VBgv71XJkgNBR5PX
	 ijL/eflBBwNT+ZvxevAh/Y3dp0n/FS8RlRv7UxqLbfJrInwryHuFAlmvb9hhPJpdJyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhd87YpE;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D681A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhd87YpE
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-847ac7ccd85so111040a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118822; x=1795723622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JE65ESt/gGhAnJwqKYj0Id/abPPd8MJA3QlWIIkVZhs=;
        b=xhd87YpEi6A3WvAlyWG+jz85KRbX+U6nLx2g0jys9+HMTPohXgI5Q682IiveezZsEd
         A6JwqmUnYdSKWvUNrB1Ng9IgIzILRHjalEjSiG1sQgsLg2J5SSz/bwLmMDgOV9cCDLiR
         YR5aMoL2YMRdoey+9xKVVFq5a1Eem4VC+ViubvR1xxQX9a3HWE+b3Apk+GmUycpNm4qX
         aAjRBYDI+UIXF6pC7JfdTkrAWLbQE+hpet2ztklBiPLcr38Cw24kO820dOmtJddJavN0
         bvpb0ynzMqzDlzfWvYzyJ2J0NEkVJnLmF/V3OUrRCynSm/WB7sS/s021D0abWNweFEpv
         pU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118822; x=1795723622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JE65ESt/gGhAnJwqKYj0Id/abPPd8MJA3QlWIIkVZhs=;
        b=qDjcOoHbn0mg7bEHEi9lrZwiKMD/Ri3wrWJt1MddiwFo3E2kuotyhOiPcxnaV+nZqS
         Ob1yunLw2MgdZeph3HFfwC12gziGCWVKNSjlQksp8EEV8TyHt+NzuegI/YdqI8LngoOZ
         cjNfyhssG22airWb/boXGZZ/ii9DTSkSj1bP7AMS9Lg4ciABbMmW7APRUxttboNbtNzR
         dfTj7V6wpS/8btSvw/JzS6bQl5Bd81Gily9lrXdx2uPQCdcAn3ERMH3yH+yZx74UCM2v
         NF7DFHs2l19dqzHzTye7L1cyoDaN070M8eeU6Mb5E50pVoAgAugaIWa90sgro3RRUZ2D
         jOBg==
X-Forwarded-Encrypted: i=1; AL+hErHrctyWCsLFDN8HTt0vIUGwu+/AeP+JKdnwFC5rH8s0RqfrBFsVQuXZ+6FBNdkVJ8vutTez4uVkd265oe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HMKFNgXP5UQ1xXexO0v7ZG99Wiz5BtogBJkvH6Uta9mELiXcu
	//yhny2PNjzI3RuHFSUzo5z9obbjrFKyLuvTM24QdxGyR7rhm1vUvYXs
X-Gm-Gg: AYBFou23zXRsZlPbz5unT1BfiyHSc6rCuBExCHnJ38IPSy3VSAoPD4Nzba2J8v4/5up
	k0fRbrcot39RnkkHf0nojmctcHQ2wlqy2hAVWg8gUun3DCq6UG0MQSI+c8s2p4rnG1v6eX8tYBc
	k5/4AqGcaX6b2Nls+OU+iZ55/zYaGgtq7ZpXbR2ORlvxUmzHubWNuEKfIgpCANk8O10hOx8FXdS
	Ug41cpWBlFNsSKVzENKttVPgcIMTlBy8VXmGtKeYs8w8oxhOLDyl4U8044gUhFc89N9Azw3QhvL
	vkfxdux8cZ5R51CHw0KZ6RLxl0RNxmifeRzAcF6kFcjR2i3OUKESSQAUu+grxH9SOAJ0T2OGAO2
	Z7gzHbCOJY8hbK19naNFifoqNvthMmzHC30NJmUfxs+N3YYRZ/8vQKfdtnU6dSV2thFn90Zem0Z
	73rtdxUmGLdrc9DRAJxVf9qFCg/O/7ZKN0/dZVYPEdRQUMXfhRALASXtlF9Aqf1a0PDdi1H+LC5
	SHOmrJ+Wt3yoTOCoSbAw6tDktYOGipq33VqOAsYOv/iarcxvVFgnI7JCARToGJLXZ0lkhIRXLpD
	nyoNrbWgcpJzcqpMKnvQ7pU=
X-Received: by 2002:a05:6830:2303:b0:862:a48e:24df with SMTP id 46e09a7af769-86315946010mr1248188a34.15.1795118821640;
        Thu, 19 Nov 2026 12:07:01 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdba0sm476103a34.7.2026.11.19.12.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:07:01 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Kyle McMartin <jkkm@meta.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] virtio_pci: limit Oracle DSC2-200 virtio-net to 48-bit DMA
Date: Thu, 19 Nov 2026 12:06:54 -0800
Message-ID: <20261119200654.1048266-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261109184253.531677-1-vlad.wing@gmail.com>
References: <20261109184253.531677-1-vlad.wing@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michael, Jason,

Gentle ping on this one. Without it, the virtio-net function of the
DSC2-200 in OCI bare-metal hosts stops completing TX once the IOMMU
hands it IOVAs above 2^48. With iommu.forcedac=1, virtio_net hangs
in probe instead.

The patch still applies cleanly to current mainline (v7.4-rc3). If you
would rather have the quirk cover every virtio function under
subsystem 108e:1200 instead of only virtio-net, I can respin it that
way.

Thanks,
Vlad
