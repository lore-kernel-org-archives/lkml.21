Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187508;
	b=5Um19/XkcTb+2npRDt51258seELZ6NKBnTBwZnjz02i6i7nnvkn/bowoXMptxIiQkeLJ
	 IWbqnzDgs8dCDBIM4B8vzwKK6L+Z/N6gXnIwcPgDRWwoFxCsvINQ+8rtRMMpXX8Pd/8eo
	 FovHwOFXhadIfAWqTwycvNck6BykMMIHueKmXg0EmceBqNtPnrh+hdhDpZxa2aFi8H3OI
	 bwP9lq3Dd+BpR2JxyjpC7CZYdvm95wpvN6o5ZRTmi6KTidcpQDxmaCZCwXlaooPyk4aDW
	 Zwc3acmWlLLGtbMmgaUHXRfH0u4UlM3IPbD5zWbZe5JADWGJZ4pSZZo3jyYOSHLwxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
	b=gA31L+/kYXKztnMcXkpOom/h6alDN10ZH+k7Oi7n3pGcn8j3Z1ZPx0VaUoPMo8Yt+u09
	 m4/LADp8zaT8wE9b+Kamuf00hPzGd/r7TmLKsq+2a3Dv0ZAVRpXrV6KTQzAsTSV6qsyfZ
	 r0Q2I+Wwx/Kxqwu8sqjpjTxMkA58rHcz64hcV4eBCw9cs3yw0XdMnpATQWVOigLny1Ib8
	 Ou4t4jrOd23DEXSBpaZB4+xMZQgZZugTeD+KSPCwYTVXJekogBPTdwNeszRNS/WShTENY
	 u7r4cX3kaqcp4EzcNO2IGLgC27R2WtMCifQIl02Y8tTfYj85zY2zzOhn9kfTvHjs1mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stefion.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXa1F42C;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F5606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752F5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stefion.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXa1F42C
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50547b4992so84284466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795187507; x=1795792307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
        b=ZXa1F42CV8EvlXMpcNdvdH3rAUyDMIKxyQuxbWmODfEAlrPkm5gY5G82sDTRUZ5uzv
         35TZYhgHC2PIPneKtcXQ70b9m4NHXau+C9PXL9HT0GhzsQWBmluwa2STfULgVVDt+zgu
         xbA230ph485ISpYl1i9zk4dD9splPYG3JNlj/vn7MZCAI0WQrV5j0altX7LIhsHxU+rR
         sA+zhTjlxHUGn+pJVOWpRJuzzp8J6tYLDsClad0cYKONX5aVvLXMcUUA8owtm6p53VFu
         vWxlOT6M5GKa7A5ivvGjsoOiABW+nwQrmTy+4TUB/FNV8RtRkcwbgGbzm883mZwN6N2R
         OAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187507; x=1795792307;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
        b=pFU6d6HamEMpeEJeSHZUS2N6gkLUiTasJ9ObEFZ1APPNipL/6kL8MpCAwVyvyGy9W5
         SBQyLdWVJ4ec5rdYnLYCoES6XbziRVLm16/dkWKYoBEblyQsPeJP++M/fHZihjPFbWGh
         qO/je/m6pkjEJphNuBA9ZbIJgv/wTeRnutcvPT+3jrP/IuqrwNuyo7XHxwIPORdPAB66
         ivp+q7+IrqHMrOh+SfC/+HANtRz5LZXofa4fG8ZDNQ8/fpvXlhTYyftz1P4bHXHnQfhq
         yBIsSiuq+zAmsXHaXKz60kjrPQeAv3vrQnGsBI5z/uOpvb51BainKChpkHBxRfeshZ3e
         GQCw==
X-Forwarded-Encrypted: i=1; AL+hErHcmDNaW5iE6fBDwN8w9RK+L26tpdwqCFwlcZ4m+jayUFOvrex9q6nXj+0no1gf7yMo5KGtptUaYd6Eqls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a79x228Ql3Zdne6sa5SXwvEmuzXDBOux2+wQlcoMG0H+y+OXh
	ESfL345PlG+If3CzgWoqfC3RGoBflCvMxwiFUuBE9K03BSspqvZtvEgQiXM/SqE8d1xmtj/y+DF
	AgdlR9H/hGw==
X-Received: from ejnw20.prod.google.com ([2002:a17:906:52d4:b0:c46:7c51:47a0])
 (user=stefion job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:69ca:b0:c50:f024:5219
 with SMTP id a640c23a62f3a-c513ab48468mr252861866b.40.1795187506339; Fri, 20
 Nov 2026 07:11:46 -0800 (PST)
Date: Fri, 20 Nov 2026 15:11:14 +0000
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120151114.3708208-1-stefion@google.com>
Subject: Re: [PATCH v2 00/19] KVM: arm64: selftests: Tests for protected VMs
From: "=?UTF-8?q?=C8=98tefania=20Ion?=" <stefion@google.com>
To: fuad.tabba@linux.dev
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, 
	qperret@google.com, seanjc@google.com, seiden@linux.ibm.com, shuah@kernel.org, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, 
	"=?UTF-8?q?=C8=98tefania=20Ion?=" <stefion@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fuad,

Tested this series on top of v7.4-rc1 under QEMU TCG (-M virt,
virtualization=3Don,gic-version=3D3 -cpu max -smp 4), booted with
kvm-arm.mode=3Dprotected (protected hVHE mode).

- All pkvm_* selftests pass. The only skips are the self-hosted debug
  (breakpoint, watchpoint, single-step) and SVE cases, which pKVM
  doesn't expose to protected guests.
- pkvm_id_regs fails with patch 1 reverted and passes with it applied.
- Each patch builds individually.

Tested-by: =C8=98tefania Ion <stefion@google.com>

Thanks,
=C8=98tefania
