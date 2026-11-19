Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076110;
	b=eFmU5Z/D9DcxEd7dMcc6jP6sLNwkcWW11+smrN/xALsbLgmINwDx2OfFfDu04Fmxnb6Q
	 AG2YLRznOgW9WUW/zZ1Rs7AXe190yPrp7isOagcrXy/Zdfvv2YkgxICf3BY9G441Azc3f
	 G7naVfNwkdUDqZb3+caWnyLZqeDwyi0lIcUQNSurb4ZqYjhY+bT0Xx4r/nVlorlgt3sH2
	 0VhJzX7IJ+PF5v+V0s38Tzpk89xqoNciNHalpwX8PilTeyTypzelzh24woIsFeKEqjiG+
	 rC4dx0ZX8ktxX2xdRQcZhylGbZFvpRjmKMHyQHwLhoJvg/EMHYC9ERvlLz9ItroL/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076110;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=e12WUId7lDqjkZPsyOhOfnQdNVGp+/N945tFdGUdtP8=;
	b=HQBLmWA6P3AIUBOr2JjdyYBEqttBbn3coqYMNW5o1oGenFEiiGDESsA0PuwZ6ByosSQI
	 zqm3PCtzQskdZ90ghTS29OA5PPb2Vj1E+Ejf+bkZN0+wTSuTxxLQzVDajL1yeNdiFupXL
	 pfVUNdoO/QlcUVD20QGzcJ97Osn4JTHbKjBAdjTzE4h/msG6TSDvqqog0KR9Lm4d3+Jhy
	 1S7QwNT39q35slm8Zzat13EeCzJoq67+r/w5YhM8kliyP39WQaksyNgh7keWnriPtZlCm
	 M0mrU5yw+oV+Eh8a2sEdoR0e2Y7B39I+yNb7fDSJZzfSaOpSZjPKUKRz1y6PXw6YIFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SXhMqyeU;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C596C60A381C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C596C60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SXhMqyeU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=e12WUId7lDqjkZPsyOhOfnQdNVGp+/N945tFdGUdtP8=; b=SXhMqyeUHug4Q
	K8Nhuax0hISOjiR3e8kj73h2ww6ydZlrjqWpGQm9i8+DA4jn5iKIzM7SC5jDnzfY
	uE2aKR2bGMPtkddjT/JMbpANdKF4v+tvqgrZIT08GSEiBXwyCMNup4gJVs1M6Frd
	RxsPaomNSXCZWcy6Cf+Fo3f4dJd6DI=
Received: from 12.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQDnowEKsP5q2LwhAg--.37710S2;
	Thu, 19 Nov 2026 16:15:06 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] regulator: tps6594-regulator: avoid refcount drain on probe
Date: Thu, 19 Nov 2026 16:15:07 +0800
Message-ID: <1795076107629-12-d78c4b5c@mail.zgclab.edu.cn>
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
X-CM-TRANSID:ywQGZQDnowEKsP5q2LwhAg--.37710S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw45Xr1fGr1rGry7trWxtFb_yoW5GF4fpr
	WDCFZxCrs7WF18Gay2yryIva4Sqr4kAayrA340qFs5Arn8JF43tr1jg345ZFZ5trykAF40
	qFWqv3y8GFWUu3DanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU1MKZDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQMQD2r+rmUDOwABs7

tps6594_regulator_probe() passes tps->dev->of_node to
of_find_node_by_name(), which unconditionally drops the from-node
reference the caller never held. Each multi-phase loop iteration drains the
PMIC node refcount by one (four puts on a tps6594-q1 multi-phase group).
Once it hits zero, of_node_release() deadlocks in its error printk (%pOF on
the parent while holding devtree_lock with IRQs off), so the machine hangs
silently with no oops and no log.

Hold a reference before the call.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: f17ccc5deb4d ("regulator: tps6594-regulator: Add driver for TI TPS6594 regulators")
---

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index fbf365a46a9e..949441a52482 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -672,7 +672,8 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 		struct device_node *np_parent;
 
 		multi_regs = &desc->multi_phase_regs[multi];
-		np = of_find_node_by_name(tps->dev->of_node, multi_regs->supply_name);
+		np = of_find_node_by_name(of_node_get(tps->dev->of_node),
+					  multi_regs->supply_name);
 		if (!np)
 			continue;
 

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    spi@0 { compatible = "spi-gpio";
        sck-gpios = <&gpio0 4 0>; mosi-gpios = <&gpio0 5 0>;
        miso-gpios = <&gpio0 6 0>; cs-gpios = <&gpio0 7 0>;
        num-chipselects = <1>; #address-cells = <1>; #size-cells = <0>;
        pmic@0 { compatible = "ti,tps6594-q1"; reg = <0>;
            spi-max-frequency = <100000>;
            interrupt-parent = <&gpio0>; interrupts = <0 2>; }; };

The multi-phase regulator group makes the probe run the of_find_node_by_name()
call once per phase on the PMIC node.

Trigger:

    modprobe tps6594-regulator
    modprobe spi-gpio
    modprobe tps6594-spi

Result:

    SPI driver tps6594 has no spi_device_id for ti,tps6594-q1
    (no further output)

The regulator probe then hangs the machine silently inside of_node_release()
when the PMIC node refcount reaches zero.

Control: with the same DT and tps6594-regulator.ko removed the system boots
and powers off cleanly.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.

