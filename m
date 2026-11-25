Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645426;
	b=lcPjarpfBdKhyd/YcxwqdQAMxGeWLmZZZ7bZLsv2pC2cg6Pwf/1YmpVaWYGjtZk9Vuu7
	 xQsCWqQOMSpqkbgLXqoahiLa/cLaJQpU6nArB/eAOFE04Uy6FXgJ/uj9aUSMcaeGrpSRI
	 yfxr6mCgH+zQtEO8EdcjpiU3uWuoTNJGYGW9fiQtCiI2iYMegx48xffdwT2eKa8VZxXcK
	 QB4ffxeEmHlk0Ac/ZvavzlFRTzEljb6ZQ+Kuym8lN+u4PlH+FRzF6K6xNSYd/EsztuQEL
	 Z+Z4lEiZQ8x53KbnmEn47D7eLWY1k5Cu85z3Duzjj3N8U5L6EG0qwaVXVkHAEPUiJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
	b=XJz/zGQeHUBSNpzL34pltyzJbUTcRoG82o0K+y10DgYLWGadRz7UocUlsf7l5WIHyR/g
	 Lw5BJWvRHgl7UrzMknQLH9aD/ZxZoN+IZRIUgzAhMXyZoGIWumnkxpRwzL1SgD+nd0qI0
	 Mv79CBAIqd62gLRW4XzARAHc0hGrKEoSM8VgIOp5EpRcTYBWBKugw2HumXNaWY9NaicSN
	 yU4bxG2naEmy+ET3D2HsgBEBiZMnTyhAbZhvJPHtku4tTaYvpbpQGcD/HfBk/mPb3k2sG
	 qKu4sEZwjcu8qp69ZKgkyyt5nI9Jx8+uAdvIzQRGbfrkjlFu5YOe7MAk/pcvd4WocpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WDlRQMOv;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E468606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E468606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WDlRQMOv
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so9498683eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645424; x=1796250224; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
        b=WDlRQMOv0AaInW8j+2FeFjZsojGwIOCsl7iRsiB7jdTFXz06GiVBAtNtfnuAfhmYC7
         gqzgTj44lxCPTjVcjXkB6pKfUEF+9993+pSBUQ7lHMw8i+zl54dPFAB64DDolY8DrJq+
         a7e6tKZonmQ8D63VDeFoZQxfOtZMZUYHtvRbNnvqMGRFeHFi8LVhp7YPRlgWLE045MbP
         lFr04FJ9j+oUTfa/O5WWq4wA6Au8hXds+aAsp0cDMT+SmuVTqYFPvM0G3BgdZnWn4ulW
         T0YRP1uXx5ZSblWDyFbEjxLIG1ekOQBXUGvC20ez/3XYvXu+yQN3IBDWMViASXBOKptE
         qvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645424; x=1796250224;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
        b=FwzvM/vrv3707KlxHOJEGtLcVyenU7sv1cvm2scBP0gDQlg8yra5yQ3L/BwR1pjlui
         g6QwjBnuRy10HgvROrJMb1vrmvFV00hqwd/WrCFJ/mV5yj9z9vQySC6UgTU+yWXHlVeK
         mvAisz1vraVMXPCBfQBAw0x66+BHXSPM4198XPLrxcOeLWIs9Bi493RB5Bd1d431mHs0
         qvqYWcijIOnjFmwFB7owt79qFoXXRIGpsWDWWzI1wo7mqQO4ML1kB4XmgMRYubDdLout
         DUQWiC4RaEhP9FMECFmNPhRMnCJXOxTzvJyQ1vBf2H2oxd4uuL0bjIe3TZGGVaOIRPcA
         JOMw==
X-Forwarded-Encrypted: i=1; AL+hErHlBLf4oDVgHsKABC9+vLmgixbVp6R2sQu96ag3J9kHc3oHQL2LTUcn1HzZ1DbJur00SkGYR34m5irliwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7HPFaGSWOeYxrjkvwol1W9I5FQRomTJ8qoRZuHZmQvN0xXCoV
	Ieog/MklOuJ9o0UVOSiRZmHYjBHYAhjmwHfFe9A1QMbk3+Fexnxsiib6aZVXn6/0WUUYXyu9CHo
	AbQ==
X-Received: from dyx17.prod.google.com ([2002:a05:693c:8211:b0:378:1191:3e95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d587:b0:381:d92e:ecab
 with SMTP id 5a478bee46e88-3856f25884emr17872862eec.11.1795645423958; Wed, 25
 Nov 2026 14:23:43 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222300.1438398-1-elkin@google.com>
Subject: [PATCH net 0/4] nfc: st95hf: fix SPI receive bounds, DMA safety, and
 teardown UAF
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (4):
  nfc: st95hf: bound SPI receive length in st95hf_spi_recv_response()
  nfc: st95hf: use DMA-safe buffers for SPI transfers
  nfc: st95hf: validate async tag response frame lengths
  nfc: st95hf: fix probe init order and remove teardown UAF

 drivers/nfc/st95hf/core.c | 151 +++++++++++++++++++++-----------------
 drivers/nfc/st95hf/spi.c  |  75 +++++++++++--------
 drivers/nfc/st95hf/spi.h  |  13 +++-
 3 files changed, 140 insertions(+), 99 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

