Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076113;
	b=DDVCMaU6+Rzq84smMjyHShxipwf2mbVRn1hD1Zbee0LLKod+UBBa0zN8LxeXcnz9Ps0H
	 lu8WLJ+myuxqP/aBTyR7qDGJeDdPjtZvwO/dKmjkGBkznQEwLg8quTgzLyi144gtYeaZB
	 JcBhhwgw6+4f8TZtgCHYVghaprCxbgOVwwXPBc4dxkW5exSqWjtr/TvB+UilsdkiSVTiO
	 CbjgLnKLpa2blFeTKIuQTs2rVlBFVtCt3exvVpFlcxROB0YQt+r43LbuSbu12kehgW44L
	 kNZ1WCmg+9vOxM3ivR9RajigeoEionvp1jJfElaLzxRciZOGk7d5tRZXD0olLDk6wpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076113;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=U9t4pJeZyZWUQxFrVCggUc/F+GKGAxiNarXEorNKZXE=;
	b=RCYax3DstxwHnTIfo2g9ff5Ft5c1PUi14NLfx42S0eBwYy9NBOhpSfNx4MMKG6gw4hiv
	 JNnh8cYXfkR+cu5s4Se8zwoBVNFunJf/oPCNq3gi3qwGP4KTPWmwt/lNCG9pQsb8wLlkf
	 CwgTtso+3S9JEyKd7SlWwDyHWHQoPvkHPzuEbeFvjw281AWmTOFs0u9nK/C74HSQaQMZl
	 qAVotGWhCDWQ5m1uqE9tMTA3rzZVnsK89wW5Iru8dtvRyevL3hijLQBI3w6wUdLzbMAEJ
	 VRrK2IUcfy3bz2knUGJs4Zmz8fzC1ZiqxqNEMI43jXyZi55UWNT8+qP0PSG+Ww1QPrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SRTO+bhk;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D78260A383A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D78260A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SRTO+bhk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U9t4pJeZyZWUQxFrVCggUc/F+GKGAxiNarXEorNKZXE=; b=SRTO+bhkMYLp3
	WFgrWO9/5K4/G1/XpEHPWV4TK7/v9vdLrppfF/atZG6r07Na9rCQpDaBEoUjN50R
	/5v9YQDqd35dQSSzrwksLfrMy/mSM/AfVhxfO54jIpCjxsr0H7T3Q02NCpslfmNK
	htDSXHJ3PWeFfxkCDmvA8+PMb6ZFNA=
Received: from 11.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQCnZwUJsP5q07whAg--.22902S2;
	Thu, 19 Nov 2026 16:15:05 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] phy: berlin-sata: count available child nodes
Date: Thu, 19 Nov 2026 16:15:06 +0800
Message-ID: <1795076106646-11-85fca065@mail.zgclab.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ywQGZQCnZwUJsP5q07whAg--.22902S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1DtF4ftr4xurWrtry3CFg_yoW5XF45pa
	9xKrW0kF40qF42krZrtas7AF1Ikw17CF95GF1vk3WUZa13JrWxtF4Iv3ySqF1ayr48C34Y
	v3sFqFyqyr45J3DanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU0rWrDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQEQD2r+rmUDOgAAs5

phy_berlin_sata_probe() sizes priv->nphys with of_get_child_count(), which
counts every child, but fills priv->phys[] only from available children. A
disabled child therefore leaves trailing NULL entries, and
phy_berlin_sata_phy_xlate() dereferences priv->phys[i]->index for them. A
device tree that disables a PHY but still points a consumer at it crashes
with a NULL dereference in the generic ahci_platform path during probe.

Count available children instead.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 942a31b52191 ("phy: add a driver for the Berlin SATA PHY")
---

diff --git a/drivers/phy/marvell/phy-berlin-sata.c b/drivers/phy/marvell/phy-berlin-sata.c
index 084671ee7d56..6ed9c8e2b6f4 100644
--- a/drivers/phy/marvell/phy-berlin-sata.c
+++ b/drivers/phy/marvell/phy-berlin-sata.c
@@ -212,7 +212,7 @@ static int phy_berlin_sata_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
-	priv->nphys = of_get_child_count(dev->of_node);
+	priv->nphys = of_get_available_child_count(dev->of_node);
 	if (priv->nphys == 0)
 		return -ENODEV;
 

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    osc25m: clock-25m { compatible = "fixed-clock"; #clock-cells = <0>;
        clock-frequency = <25000000>; };

    reserved-memory { #address-cells = <2>; #size-cells = <2>; ranges;
        phy-regs@7f100000 { no-map; reg = <0x0 0x7f100000 0x0 0x1000>; };
        ahci-regs@7f110000 { no-map; reg = <0x0 0x7f110000 0x0 0x1000>; }; };

    sata_phy: sata-phy@7f100000 { compatible = "marvell,berlin2q-sata-phy";
        reg = <0x0 0x7f100000 0x0 0x1000>; clocks = <&osc25m>;
        #phy-cells = <1>;
        phy@0 { reg = <0>; };
        phy@1 { reg = <1>; status = "disabled"; }; };

    sata@7f110000 { compatible = "generic-ahci"; reg = <0x0 0x7f110000 0x0 0x1000>;
        interrupt-parent = <&gpio0>; interrupts = <5 8>; phys = <&sata_phy 1>; };

phy@1 is disabled but the generic-ahci consumer still points at it via
phys = <&sata_phy 1>, so xlate() walks a NULL slot.

Trigger:

    modprobe phy-berlin-sata
    modprobe ahci_platform

Result:

    Unable to handle kernel NULL pointer dereference at virtual address 000000000000000c
    pc : phy_berlin_sata_phy_xlate+0x30/0x60 [phy_berlin_sata]
    Call trace: ahci_platform_get_phy then ahci_probe

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.

