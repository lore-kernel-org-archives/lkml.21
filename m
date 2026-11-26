Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719093;
	b=S8CJ5rnKy8DGjnVXHyklVdmGyMnFAEjIiKFS3SiXH32EUOU1EJ5MHDZOWaS6zvFN54T4
	 VWRe1KqbHmMdfpEUZbPr8sXIdR2kpWTzaX/dckOzaA4N4cfOmwe+ItA3nPU2bwZ54l/VA
	 CUc4yd+1OxeBOl9+MH8rXnazY+aKMyxfcfCWs3JcE6gGqZrn6deDnS3pY26qPj+Emq9LA
	 fDAPBHTHFiUuKHWVTH9zKL+2AkgGCB4ENE6/fjfSJ7e6V8GVAny1pIRg7bOLfVMWKEzAx
	 /TxEpAfRsk0KVHO3uTwz08MIQaWniGCkDQ/KogPG7FWgF1yGX0fA8yrZ3I8BcFC4/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UdCYIM2C5CRKg0+w9ZHLQevjQ1zBFoWTXLA/jRWFBSE=;
	b=GYT0ZFyzKn4qyyXvUJ/DSxBPOf632wn9pVbCpzUA6eYDzUXPZ8T1/LYUBMSw53oSplx4
	 D/EorWQIfdg7SHKc+kC44uLCTjFpHIH/PYbypvqEjFhP1wDbCZvm5NFxlOKwzo57s0dQS
	 j2ACmINLZMAAddx8b7QcTHok41pXrOhcyCuaZV0lGEb8RoP31IXnM0Rdb8hxB/vTcQEVo
	 jia0Q8e7S055N3xd+SP7lVyMID0pvWlCRWeJlzVcXJ4aLDklz/XTYCvWvmSK9LQv0leoE
	 v16n/Zvix3frOABxVSoBPheeEgwWQCTihCuEJvPACqO5UP8MnY7tpMwxvMAM786n7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdL3AZuK;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E837C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdL3AZuK
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f06ff94acfso32714475ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719092; x=1796323892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdCYIM2C5CRKg0+w9ZHLQevjQ1zBFoWTXLA/jRWFBSE=;
        b=kdL3AZuKVxsY44TVB7xqcvNvoxhiBz5Ii/MCbzUT8YcztZX2QLb3S9rrHON4S0t/4T
         aGAlFo+GAmn9nOvI1ulbdGlQq9GWcJnONEZgJ+v24ZtwIvZ5o4J+JYodYqroe63wDQdm
         yY9gFh8+Of4vpkSTZLDh3735KfTLaLqX67kHqubMkUN3xH0auraWvm2N6wKsk/P6CrD5
         iIRaSPDpYRHpSjLHI9GTA3wxR+Qfk5Tn3KAuw0wlGsCLYkgPNz6cng9i5uFuxe1L5zd5
         XEhDDFLzQcjwifUn758wHtOd9L6fW80EGkT5ePA0MlKynKN0474ArxJrVUyZds2X9IX9
         9FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719092; x=1796323892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdCYIM2C5CRKg0+w9ZHLQevjQ1zBFoWTXLA/jRWFBSE=;
        b=2jT1x0Ifp/WS4gAkTmcFijlkyfI6HffNbAzxyw1ptwm7wEPvy7CuyMPfZS453E/YjD
         iQrMOpbvkDPW6rTkM+SNyEsfec4CHQiPV4n8viR8ldH1Y9jboaaf+CWgVBPSEL5N8jwM
         B+WbePhMN7FMIxYaBu5HJvLpzIGt1q/znyqM84uZKW2Qgrv88Pm/mhsI6BhgxghQoJL4
         n+w+eSIvwmtopDfEYLudRHrPV4XOIuXQk3jpqOMy9RjctGk4G8JZIXxy25MjUKKJCaGW
         PHiO+cONtmg9CkHVMKGCI8W7j/8ZwbEgXeAtKBP+C6BXnP0WkE8hmNEjc8xY209q5DnQ
         Lytw==
X-Forwarded-Encrypted: i=1; AL+hErFaYySOM22gtb2lIRFpqlez6dTOVorr5wGM6+ZqVO8efqGva7l/Zhygmg65n4L6XK3F0nO+Lez74RwxiOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jdyJDW6gl58k3woisCrz20etb7PvkU9kY++QgZxE2I0tYjSw6
	0INONgo+hEKfb28WwbyuwTQzFdjJEjZF0nJh9q0GMSkdDBQ1lrVzD4zD
X-Gm-Gg: AZFdTZepM8xvmMWGCyZRkxapP6F+eIP/CLuYscHgZJj+MkNFw1MkK+JomoNQhp42HDM
	pQCvTeB5b3GJf3WDw+X8bH2FP9lblO7ddNns146YG+vbZWeuDnFmxv3hfbnXRRz1TSn8aZBL8ys
	f+1sJjQjUDzvrDQFIScu3Ab0TYIZeXz1KVb+OFSYSGYKY/4TlrSUi4GkmcL5HadfziWh7JiClDJ
	datddz6lxrrJnB0waXkOH49n54/ofTGnx9bFtpqDlksEQOeLGmJVnh3eUfUDWebgbAbGDoF6WUd
	kXXOYEQ8d7m8VAHCafrpnAHwd6vdhmd0OioGK2HufaS2qKRQQ6awgdAjDLc2a0uDanDvd26O3HF
	EYqbkouQac+7kk6iM6gE3ppk/p9EdsBI8grdSqztGrOQWnk3zF+6kaCZTiGT6RrulmfOFagEsju
	qcxeZs36AAhcyeXoAgP1fUZrPpDypBVA+Tb/lcOOUnLHatDFlLphldPAtZ97jzJQ3Si5kH2+Kxw
	Vz99auKYHxEuCfP8PMgzOJdpDoPPZe+IbxsOaqQNPE7Uug0YOtLvXyveFB4K5agvMlIgdw5kZtn
	iabYRTvZ92Rxl/1PdOHRnA4Qye4Mu9Pn1MXh1R5j2kOWaiSyxDa4HJqmES6+hE81ApwEQNv8qaw
	LQfcWdHjJvgCBUYU20c/+Vvjp
X-Received: by 2002:a17:903:19c5:b0:2dd:ad73:5b6c with SMTP id d9443c01a7336-2f0ea5af0acmr35718495ad.28.1795719092175;
        Thu, 26 Nov 2026 10:51:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:31 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/7] m68k: virt: Switch to generic goldfish PIC driver
Date: Thu, 26 Nov 2026 18:51:13 +0000
Message-ID: <20261126185120.3815699-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

Convert the m68k virt machine to use the generic goldfish PIC irqchip
driver instead of maintaining a duplicate, platform-specific interrupt
controller implementation in arch/m68k/virt/.

The whole patchset is tested on  qemu-system-m68k -M virt and verified
that interrupts across multiple goldfish PIC instances fire and
increment properly in /proc/interrupts.
---
Changes in v2:
- Add depends on HAS_IOMEM
- Add patch 7 to take over maintainership

Link to v1: https://lore.kernel.org/all/20260908094016.1997918-1-visitorckw@gmail.com/

Kuan-Wei Chiu (7):
  irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
  irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
  irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other
    architectures
  irqchip/goldfish-pic: Add goldfish_pic_init() for non DT platforms
  m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
  m68k: virt: Switch to generic goldfish-pic driver
  MAINTAINERS: Update maintainer for goldfish PIC driver

 MAINTAINERS                              |   5 +-
 arch/m68k/Kconfig.machine                |   1 +
 arch/m68k/kernel/ints.c                  |   6 ++
 arch/m68k/virt/ints.c                    |  89 ++----------------
 drivers/irqchip/Kconfig                  |   3 +-
 drivers/irqchip/irq-goldfish-pic.c       | 113 +++++++++++++++--------
 include/linux/irqchip/irq-goldfish-pic.h |  15 +++
 7 files changed, 108 insertions(+), 124 deletions(-)
 create mode 100644 include/linux/irqchip/irq-goldfish-pic.h

-- 
2.56.1.839.g22a8290db9-goog

