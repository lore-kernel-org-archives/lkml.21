Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645635;
	b=Du8XmQfEua/4aTBmMfWASYXqej5yZ9Re0rbzdjYGi+YGN/X8xXdRVvJ7DbM0km5vP6iy
	 ejcDuUwuut4GkrujBYJ2j5mjT9Z4lBzaeUOjINawICFhl4ChCXSuBha1p0bS1pAyR4c8j
	 7uT59uGR4G7VAqZqigo4DRYiQoswnkXhT72Ef0tHiNb4JVLEoi3spruZTExzBiCGVugr5
	 4DKM/pAkXZzw8HoeBObki5OLO98PRGCSLGjKGHXj42laARnAlogW6UT/4Mp8XbIy37Exc
	 4LJFaTJ/LXdK7NtYpjAg+lcI+vwL0QwXn2XJVoCpzpO9s2JOPAg1CTx5mzifcKrEcOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
	b=rtiFG6ySASy3jr6ConOByH+d1jCdGxLLDUt9doexz76ttAq7bCyk4vZ+zVZQlN5WTmhx
	 ibFOP+Dhp9ljWu6Xqx3/alP9u09nKWY1V+NsjoJIS4nQBk//NDBm+gzkAsbDJUaT5a0oi
	 fFvSneWsf0Zdo330LrSRIxNxhp0B9lBBkhnJ/9aIX5Toy40o2x0WMyUDLH9qk3bEhSC6K
	 dip73eBNv0Ow6wd3tNumhBsERZpZjWG6HLmZpYWjvSdmeTlzzg8w3N2yndxN2QZkSGyDd
	 WroNoD0Dstzn1yeN3D0bjQoIEXv8SJBOXZqxKVAnC5FhLQDUYsvl/YxKv1EAfFOykkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jaO0HsqW;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32587606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32587606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jaO0HsqW
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7337165eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645633; x=1796250433; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
        b=jaO0HsqWvDhXsTL1z+rc8IVo2zErMi5qnH0mxcNXuYgGSIoTvcURxSkEvGyO8BDJJw
         qV98AOrRAJWrtKb5oLghEpNFo8apBTwVmEmzevW2vcRKRBWcU8gIMAQDn605jljUqWP6
         FbqroJaQuCM3sliHhtog+jxQu6OAYnhDw6sobLPQi6E3lcis7Rn8bXyHQN6hteCM4AUN
         I27w1VIQ8mf5gDdYvPVrgCcYWgbFbi7cq+taOdfcEmqOuSPKWlebJFrJm0m1YOs/bUvR
         3Zk09iO/MZHyWEWTxk6Qamk/eav8FlBPZarvGNAnoqrkXHbAN1aGev9Re/ijSqAFK9zy
         gbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645633; x=1796250433;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
        b=BBFASLNs6Sf1tZo67bHYjR3gOnRQw0Ai2/kUs5owRO2eIHeOurxVajqEKRt4/2fOeY
         HmgZlUId4AkiPIsp1nT0NRlhV4qTuBHJZe/5n2TrevSOuoiEiz3bxIiZ0ZouQOxdgi5r
         70VXpvsDCrbSpvLpMow1h9g4bs476fcrDhiaZXM91PWBY8o5sY8sjqPMf2BL1qalERRL
         dcLz1aU/LRSTHJd7CJNg5C6m/Sntz0d3uMlW3Z3ZiYqEh4FP0XGB7MSkMfwxdgwMFN2Q
         ncqFvMY5m4F1X41DSfJy9RWqrkSzyNO3HRwIfisCFlsHhHBkpVnm+eNVm6/B6b7NmS6c
         Z+Pw==
X-Forwarded-Encrypted: i=1; AL+hErHoBs/Z8hVLL6XWvbvL5jVtzcZswmAre+3gCVYOC4LT60B2GNtei5GitNK2MRv5AP3dAUb3Mg6poe/8Iyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wYc9MtWF+BWdoHUOb5Ppqt2opc/ZW171Gv66UbO9Uk2uOpoST
	HAE56vRBx1sJUJIdhaDLJsMWr05hDmwiMCzqOBgkqqgHyqs7BalQ2aT1UMwuRfOSodBffkOlduH
	3iQ==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:386:af9c:96b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d81c:b0:386:b7d2:a279
 with SMTP id 5a478bee46e88-386b7d2aba6mr8835631eec.34.1795645633028; Wed, 25
 Nov 2026 14:27:13 -0800 (PST)
Date: Wed, 25 Nov 2026 22:26:06 +0000
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
Message-ID: <20261125222606.1448637-1-elkin@google.com>
Subject: [PATCH] pinctrl: nomadik: validate DT pin config property read and range
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nmk_pinctrl_dt_get_config(), of_property_read_u32() is only checked
for (ret != -EINVAL), passing an uninitialized val to
nmk_dt_pin_config() on other error returns. In addition, val is signed
and nmk_dt_pin_config() returns 0 even when val is out of bounds for
nmk_cfg_params[index].choice.

Check (!ret) after of_property_read_u32(), make val unsigned (u32), and
return -EINVAL when val >= nmk_cfg_params[index].size.

Fixes: e32af8894588 ("pinctrl/nomadik: add device tree support")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 24 +++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 617ad259f62c..400009929dbd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -693,18 +693,21 @@ static const struct nmk_cfg_param nmk_cfg_params[] = {
 	NMK_CONFIG_PIN_ARRAY("ste,sleep-pull-disable",	nmk_pin_sleep_pdis_modes),
 };
 
-static int nmk_dt_pin_config(int index, int val, unsigned long *config)
+static int nmk_dt_pin_config(int index, u32 val, unsigned long *config)
 {
 	if (!nmk_cfg_params[index].choice) {
 		*config = nmk_cfg_params[index].config;
-	} else {
-		/* test if out of range */
-		if  (val < nmk_cfg_params[index].size) {
-			*config = nmk_cfg_params[index].config |
-				nmk_cfg_params[index].choice[val];
-		}
+		return 0;
 	}
-	return 0;
+
+	/* test if out of range */
+	if (val < nmk_cfg_params[index].size) {
+		*config = nmk_cfg_params[index].config |
+			nmk_cfg_params[index].choice[val];
+		return 0;
+	}
+
+	return -EINVAL;
 }
 
 static const char *nmk_find_pin_name(struct pinctrl_dev *pctldev, const char *pin_name)
@@ -724,11 +727,12 @@ static bool nmk_pinctrl_dt_get_config(struct device_node *np,
 {
 	bool has_config = 0;
 	unsigned long cfg = 0;
-	int i, val, ret;
+	int i, ret;
+	u32 val;
 
 	for (i = 0; i < ARRAY_SIZE(nmk_cfg_params); i++) {
 		ret = of_property_read_u32(np, nmk_cfg_params[i].property, &val);
-		if (ret != -EINVAL) {
+		if (!ret) {
 			if (nmk_dt_pin_config(i, val, &cfg) == 0) {
 				*configs |= cfg;
 				has_config = 1;
-- 
2.56.1.839.g22a8290db9-goog

