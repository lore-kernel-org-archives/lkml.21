Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686841;
	b=3ReTsWg8T8RiDt2bkXq/e/HVHmW3n7bUnVaROFZXYv2LEtIedzHTH8kbQy90XvcI277G
	 7e8mx9eZ/IwXTzEF5dKjBl5JIy+I3dvO4MMlOAbSYdm2pw04EuTGz16tSISY+jSehSbB1
	 CuCCtIAKUatWjaQG1kgg2KtLQ32bIPxkCDTzEy0mC7H8sWP5pKWzVpgMXX6Rnq8zM87ay
	 D+pRncsf3Q/mEiKDCu7z0xd/fp60DfPQoe8K4gsSTsuyAu+5qRjEEdDBECBJuf9QA6i+Z
	 bzneDPUAdSUBwjeOYtzkXxxga26pTMTplnQ5QLlWX3TP59XbS7poGy00q3QePlLaKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686841;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=Xl/6OZoY02aX7zQH1idjQhEk9ZHTnGopECZzN0NKMFo=;
	b=g2xw25XUekjPJCxl59h/A7fs42EZUfUyr5c7Ld3siol2AQVJUpZAAptTALUvJUw+G/m4
	 HSHLBhO6aQFKc9lYRuRtuqT9PM2WSrCUra1sINgZ7dElnlponH1vrXaRTlMlokimjAcaU
	 ohQs5PeMPq2fynLF2CWeGDyz/WULx1JMk8M1n/ONFOHcmYrKttkthWq7D7gQ+rMVAyBFy
	 8vKXL85iC+LpXRPiUbelBxObGkbjewhuTtAN/CAFingTtPsSW9WTh8dwX7Va+7evZaPKZ
	 L0aL20E3pIqZg6g3NgrrF5U+oLNPjNOBPaeK9MLgTTQw3042K2S5epsUpcimsTwo//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B9606A688
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477B9606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowACHlpeqAQhroXXXAQ--.21086S2;
	Thu, 26 Nov 2026 17:53:46 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Thu, 26 Nov 2026 17:53:32 +0800
Subject: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V THEAD
 SoC
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQBJJYryIu0vjXjmiUTCpC6
 d2NuniLb/NWUhSB0qFbqeAlKo/cYHYdpTnmC1jOzWR7642xnutsnO35HiXXFopy5nSLi4IHF9w
 47RGG4KkdngWTvH/34+lvXcYrUv0uads+R/H+Y38AAAA=
X-Change-ID: 20261126-th1520-maintainers-n-clause-9575bf8e7976
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:rQCowACHlpeqAQhroXXXAQ--.21086S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1xKF15Wr15uryfXF17trb_yoW8Kr1rpa
	13Cr4xAFykJF45Wa13ta42vr13X3W8ZrWag34DKa4kZFn09F13t34SkFs8WFWkJFW8ZFWa
	yF13Cr15W3W7Kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBmhwUUU
	UU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

As more and more device binding / drivers are coming for TH1520,
indivudal filenames now bloats this MAINTAINERS entry.

Use N: to match th1520 in filenames instead of listing them.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 MAINTAINERS | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..fbf9094560a38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24198,29 +24198,11 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/riscv-thead/list/
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git
-F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
-F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
-F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
-F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
-F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
-F:	Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
-F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
-F:	drivers/clk/thead/clk-th1520-ap.c
-F:	drivers/firmware/thead,th1520-aon.c
-F:	drivers/gpu/drm/bridge/th1520-dw-hdmi.c
-F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
-F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
-F:	drivers/power/reset/th1520-aon-reboot.c
 F:	drivers/power/sequencing/pwrseq-thead-gpu.c
-F:	drivers/pwm/pwm_th1520.rs
-F:	drivers/reset/reset-th1520.c
-F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
-F:	include/dt-bindings/power/thead,th1520-power.h
-F:	include/dt-bindings/reset/thead,th1520-reset.h
-F:	include/linux/firmware/thead/thead,th1520-aon.h
+N:	th1520
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261126-th1520-maintainers-n-clause-9575bf8e7976

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>

