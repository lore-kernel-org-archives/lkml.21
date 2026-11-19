Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076112;
	b=dEt4zzwz58k6z82b2wJY7MQROqFmMuyuRG3kOeVMXee7rX5eOsunkBNo0LDq8+Z+t/7+
	 ERE10yQ9JEPG5o9KQwhcKPkxTBaIJTa9Pf/Rz8hBGyxUi0ggPaNtmk8rGu5MkiDffobsL
	 oRnUONRuzHdhhhfmHbcczfm9Jpz514MbjvCG20AhGGKPqtD8blEvUg51eVtIXdt/NsSbu
	 xY01EreIWOrVACs/llxjtAl5/5NyopB1lQBr1MXDb1rMnW16qYqkC5ImSZSc6lOMdB83u
	 h8CZE6dJ0Pv55+ujcKedGkCYGUGpXDo/fPfTwxUnV62tFB2rvrVY0z3urd5uoFBYAWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076112;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=YyReaC6xJTCbGjqg41g4uWdaugUUeN3IKRBOb+F7ocU=;
	b=g4TAfNdbnvTUFAtCePRhK+4dwTdMz/PLVjByFPS+i9an7/Fq7ZWMyED+40p/ROHvyq/o
	 MsUK+uo3Y79D5swVuP0ao/+FDWvuPtipDFYD43qBwFvWAh/6zeq6Z3GRfOSV382o46IY/
	 6+0AL88KNxZjZ8h9pr9Awu9MXCfKH2e/qFn857CnSf/9eNa/M+Dak4DHDgWHXzpAYgjv3
	 1Civgq7y6fipVLoTn8BINLM6QrmvY6CT5GVxGqoFpKBJJb2wKkv7gt8YFDE5DrehtnDdN
	 EIu5ELHeE+A7nJouZ4v/ksq6P16e/Y7NA+31NJOitXza2EA0WekGuexUKfFNT0rpsXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TfzCtLYN;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCBB606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCBB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TfzCtLYN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YyReaC6xJTCbGjqg41g4uWdaugUUeN3IKRBOb+F7ocU=; b=TfzCtLYN53dfs
	6YqgYSPWFMkC35ufvS1qi60C7K1+KUbRyIuipb+RAlam9MhVYMmdyLeFQ9bomS4D
	hoEgwQaT6DGYEjacjTPvBXq9calxBA+Wo78K3QHXyNymvTG5hGVyEjfA36JOeuJM
	qCopfbwzk6Q4lQfX0Ski5lf7vd2HG4=
Received: from 08.eml (unknown [58.206.202.11])
	by web3 (Coremail) with SMTP id ygQGZQCHKYwFsP5qE1LEAA--.1414S2;
	Thu, 19 Nov 2026 16:15:01 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: lee@kernel.org
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, mfd@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] mfd: stmpe: Disable regulators on probe failure
Date: Thu, 19 Nov 2026 16:15:00 +0800
Message-ID: <1795076100902-8-fa247961@mail.zgclab.edu.cn>
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
X-CM-TRANSID:ygQGZQCHKYwFsP5qE1LEAA--.1414S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw13AFy7Gw48Zr17uw15Jwb_yoW5uFWkpF
	WDXrZYkrs5WFW0kws8Ar1xZas3KrW7ZrZ7CrykW3yrZws8uFy7JFZ2kr1FvFn5XrykJ3W2
	yFZFvry0kF12qFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU5FApDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgIQD2r+rloDYAAFsZ

stmpe_probe() enables the VCC and VIO regulators early in probe, but they
are only ever disabled by stmpe_remove() on the successful unbind path.
Every failure return in between leaves both rails enabled, and a later
-EPROBE_DEFER retry enables them again, so the enable counts grow on each
failed probe and _regulator_put() warns on each leaked enable.

Register a devm action right after the enables that disables any regulator
still enabled when the probe fails or the device is unbound, mirroring what
stmpe_remove() already does.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
---

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index fd51ba74275c..9475a257acdb 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1363,6 +1363,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 }
 
 /* Called from client specific probe routines */
+static void stmpe_disable_regulators(void *data)
+{
+	struct stmpe *stmpe = data;
+
+	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
+		regulator_disable(stmpe->vio);
+	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
+		regulator_disable(stmpe->vcc);
+}
+
 int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 {
 	struct stmpe_platform_data *pdata;
@@ -1417,6 +1427,11 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 		if (ret)
 			dev_warn(ci->dev, "failed to enable VIO supply\n");
 	}
+
+	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(stmpe->dev, stmpe);
 
 	if (ci->init)

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    reg_vcc: regulator-0 { compatible = "regulator-fixed";
        regulator-name = "stmpe-vcc"; regulator-min-microvolt = <3300000>;
        regulator-max-microvolt = <3300000>; };

    reg_vio: regulator-1 { compatible = "regulator-fixed";
        regulator-name = "stmpe-vio"; regulator-min-microvolt = <1800000>;
        regulator-max-microvolt = <1800000>; };

    i2c@0 { compatible = "i2c-gpio";
        sda-gpios = <&gpio0 0 0>; scl-gpios = <&gpio0 1 0>;
        i2c-gpio,delay-us = <2>; #address-cells = <1>; #size-cells = <0>;
        stmpe811@41 { compatible = "st,stmpe811"; reg = <0x41>;
            vcc-supply = <&reg_vcc>; vio-supply = <&reg_vio>; }; };

The stmpe811 node has no interrupts property, so the probe enables both
rails and then returns -ENODEV on the no-irq check.

Trigger:

    modprobe i2c-gpio
    modprobe stmpe-i2c

Result:

    stmpe-i2c 0-0041: stmpe811 configured in no-irq mode by platform data
    stmpe-i2c 0-0041: stmpe811 does not support no-irq mode!
    WARNING: drivers/regulator/core.c:2678 at _regulator_put
    WARNING: drivers/regulator/core.c:2678 at _regulator_put

Two warnings, one per leaked rail, and the regulator use counts go from
1 to 2 after the failed probe.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.

