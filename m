Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562303;
	b=vBEnEk++ovpBXOtDyhFEz63fkEMWFzFs+clI8TCYXp3t42TP0fLBBf0N7lK8wnylVsCq
	 TSveS8UG5UnPKEHyGQG6D25FQSPgxdrtCyG6YBueQEb9bDVfuFTOWRX7fnzfFnppChog2
	 oidS5ijlLXWDX5vJcXY7sK7Q8rb6vCmqv78+IvnI6FSfYEHjzlwacHMsA1d9uQnCHedMU
	 aqJAPnugVLXHHjcQxqYiYwH2DYWedtGajH4K7lDZQ4n16EB4yVQspBdR0Iigovtb8z+s+
	 xOy3UaOIc/8fYbY9+gn0SdkW9pLabbTl3i0aYQ5ScZaVZ/z6G+BLMlPzVcVL+qDxGpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JSPW10Pj7mWYrcYQV491CeBQq8pVVNVHWtKBSkpxQdY=;
	b=2xH+7EBgCqnXtWHOfu+REaMntRAwZdV2anGpZgwHf8zC5MDRTkm29Ly35txozNJCRGG1
	 kH/chSVATFZBLAbHyYuQsDDhOVG5Z29bFPc21FjruqbMhRXnyx2H4ncbfQ7A7I5O3AFLw
	 6xd/uVJF2KKtOb+GhmnjHMW7v5GNN1BYlxJE7q4t842h9MlD/pLbL5W81aYDYC8VRmqDV
	 q7T5MeJR2COLl8Q/gOzH1IZWb4A3q37Qzc+kIiR4sqTU+YB4881OM5RvZI894r+ynbpLC
	 i2efOXbex6HNZKxWMtZQOjPEJYGcsWphPMrl4q+9MTCscvK3vwG01TZMBEoAJ4CQu6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI0ND5xy;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC0D606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC0D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI0ND5xy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so49767695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562301; x=1796167101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSPW10Pj7mWYrcYQV491CeBQq8pVVNVHWtKBSkpxQdY=;
        b=SI0ND5xybHzRNkTlF7R69RrtN0WhAy6NS3Dqdmm282zxlySUryxFPjZeqOA4ldnWb5
         FH5OmdYtPtrzSV66UbadG8hPTKejk4ztYaXVtXsnANibRwzyjV5hK4KeIQHNVBbQvaJ8
         M8ZqJzEZ1LjwxzAt1FAa0FRaRwWF14rRR9WAxrdJJVo4Gowm/qAmWnKjuBGVOjlJqv+r
         P3OyJS9FfRtChwteYvHKD12yKaZklv9pTtspU31NsUjDGL5LRdbPPsQVglSLOr1fWF+6
         hIMCrU4rXEasa62orHeuZTrLDr7L1PNS8HdrlgyGxv64YzXyfuvVxBW4ZKB3h+qA0NDk
         zg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562301; x=1796167101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSPW10Pj7mWYrcYQV491CeBQq8pVVNVHWtKBSkpxQdY=;
        b=vTnWsDoDXJzu9J7NYZYNqgDrCKcWTMnx1zlSQbEq9fLSQ30Chpj0ZOPJm4nRtdXLNy
         0G71HA6ODmeza/qh2IVBjDQ8XGv+jaO/M4/cY7ivCgosLnyjn1qhOSp9+UqrJOzMpVPo
         tk26sjfSPZTOWCqqVmEQGDI3toqF69WuIahT03oYVQJk6EIYeLQoZHZYpctbRDok9X2d
         jocdGaP59qmpmVPaBaLmsKrLN4ShQ7KEVlhZZIvF1ERc03QiPphp8nvBvjrVz8Y2an9S
         Y3iezlWOUelsOpTNdqAPJH0eSbt8EsIC0MAv5XD44YY7jpwVvKwNGUzzxBUcaJqfMweM
         kQ8A==
X-Forwarded-Encrypted: i=1; AL+hErEhuBia6NfytFerp07HapigfjIJbKzLDS7GpR+1NWP3am8UbyniJNS79f5OZa9OE22Z441RSwJW7nIPS5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LHFg8NewYIIHD+n2lFl1N4ZrzrfrL4sonODCtFx8/dhq2Zmth
	0n5Smjc3kHcAAcxjrg+rxs/XXNbKcbG+hRji7PDYx1+G60MXsN38hS6yaufXhnOh
X-Gm-Gg: AZFdTZdh30Cth/3H0hldTvVRkWV7vquvk0xiWP0Gdog5og55CrW+MU9nGoFQ+pCu0We
	DV9zGU5d6618UH9ZSt1wXqw+kfSIt8EOsVyz/0rdtQteWR7cqfX4DHSpmq3Lscx6Hx7Bh7pJluq
	ajOS4DHQZJm7ubIwJL0s+pnYTWRdsJWJPrKZAM7ZORix+wMI/ltUWevCjioOhOfN8ZyuEPKtt2I
	pK8U8IFQdVr25odSPNQwrclZPjgeFccgOCnCbt0KpImlM/cDjZi5yQMTH6OW7pobZXCVZUa7VmY
	BSd1eQKZyW9APzVkg8zgU9pcjwo3YQp7rzITwGcML5ZDXy4eqH2C4VSWKrKl6CVNEi3E2sR83AD
	+Bw67NLp2rHxJdqxhZZsK2AwtrsGqxZbJEnToP0zjObrsx1i2H1tyVy6p4tyrfggusnatpDYYp6
	on/zYAojPa9X8z0ja2dEb4da1Z9hoDxq38Sbgx0X9BcXJkc5KjtVjWO5MUKCqZWul0o/eycDq+X
	RkjEjBt+TFkKeSM10aD1EhIN3uTNDPdh7aiLNsCMHKzvCEX4FyMtgUoPoeo5aBLS3cF5Xy1qW04
	4Ieq5Fc+jdQTg3B+9T0h0JOrFa2M1/kVaSAAuu/4PHxfdEsMjfmIxloCcaMl7k1J4jZbqPRh
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr303656325e9.4.1795562301128;
        Tue, 24 Nov 2026 15:18:21 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:20 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] clk: allow a clk_hw to be registered again after unregistering it
Date: Tue, 24 Nov 2026 23:17:49 +0000
Message-ID: <20261124231751.83938-2-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124231751.83938-1-joshuacov@gmail.com>
References: <20261124231751.83938-1-joshuacov@gmail.com>
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

__clk_register() sets hw->init to NULL, and clk_unregister() leaves
hw->core and hw->clk pointing to the clk_core and clk it is about to
release. A driver with statically allocated clk_hw structures can
therefore not register them again, e.g. when its device is unbound and
bound again. The second registration has no init data and oopses. A
clk_parent_data.hw reference to such a clk_hw also resolves to the
freed clk_core of the previous registration.

Keep the init pointer in the clk_core, and put it back into the clk_hw
when the registration fails and when the clock is unregistered. Init
data on the stack of the registering function is gone by the time the
clock is unregistered, so leave hw->init NULL in that case. This has to
be checked at registration, as object_is_on_stack() only looks at the
stack of the current task. Also clear hw->core and hw->clk on
unregistration, so that a reference to an unregistered clk_hw is
treated as an orphan.

Fixes: 0214f33c4e0e ("clk: Overwrite clk_hw::init with NULL during clk_register()")
Link: https://lore.kernel.org/all/179545567027.246915.947299820828330388.b4-review@b4/
Cc: stable@vger.kernel.org
Co-developed-by: Brian Masney <masneyb@kernel.org>
Signed-off-by: Brian Masney <masneyb@kernel.org>
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
 drivers/clk/clk.c            | 23 +++++++++++++++++++++++
 include/linux/clk-provider.h |  5 ++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4d2cc86bfb..c19ae1812c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
+#include <linux/sched/task_stack.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -70,6 +71,9 @@ struct clk_parent_map {
  * @ops:               Pointer to hardware-specific operations for this clk.
  * @hw:                Pointer for traversing from a struct clk to its
  *                     corresponding hardware-specific structure.
+ * @hw_init:           Init data of @hw, put back into @hw when the
+ *                     registration fails or the clk is unregistered. NULL
+ *                     if the init data was on the stack.
  * @owner:             Kernel module owning this clk (for reference counting).
  * @dev:               Device associated with this clk (optional)
  * @rpm_node:          Node for runtime power management list management.
@@ -119,6 +123,7 @@ struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;
 	struct clk_hw		*hw;
+	const struct clk_init_data *hw_init;
 	struct module		*owner;
 	struct device		*dev;
 	struct hlist_node	rpm_node;
@@ -4457,6 +4462,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	if (dev && dev->driver)
 		core->owner = dev->driver->owner;
 	core->hw = hw;
+	/* Stack init data is gone once the registering function returns. */
+	core->hw_init = object_is_on_stack(init) ? NULL : init;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
 	core->min_rate = 0;
@@ -4505,6 +4512,9 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		pr_err("%pOF: error %pe: failed to register clk '%s' (%pS)\n",
 		       np, ERR_PTR(ret), init->name, hw);
 	}
+
+	hw->init = init;
+
 	return ERR_PTR(ret);
 }
 
@@ -4656,11 +4666,16 @@ static void clk_core_evict_parent_cache(struct clk_core *core)
 /**
  * clk_unregister - unregister a currently registered clock
  * @clk: clock to unregister
+ *
+ * The clk_hw of @clk is returned to its state before registration, so
+ * that it can be registered again. Until then, a clk_parent_data.hw
+ * reference to it is treated as an orphan.
  */
 void clk_unregister(struct clk *clk)
 {
 	unsigned long flags;
 	const struct clk_ops *ops;
+	struct clk_hw *hw;
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
@@ -4709,6 +4724,14 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->protect_count)
 		pr_warn("%s: unregistering protected clock: %s\n",
 					__func__, clk->core->name);
+
+	hw = clk->core->hw;
+	if (!WARN_ON(hw->core != clk->core || hw->clk != clk)) {
+		hw->core = NULL;
+		hw->init = clk->core->hw_init;
+		hw->clk = NULL;
+	}
+
 	clk_prepare_unlock();
 
 	kref_put(&clk->core->ref, __clk_release);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee51..026efed876 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -359,7 +359,10 @@ struct clk_init_data {
  *
  * @init: pointer to struct clk_init_data that contains the init data shared
  * with the common clock framework. This pointer will be set to NULL once
- * a clk_register() variant is called on this clk_hw pointer.
+ * a clk_register() variant is called on this clk_hw pointer. It is restored
+ * if registration fails, and when the clock is unregistered unless the init
+ * data was on the stack of the registering function. The clk_hw can then be
+ * registered again as long as the init data it points to is still valid.
  */
 struct clk_hw {
 	struct clk_core *core;
-- 
2.56.0

