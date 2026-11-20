Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205324;
	b=ykAsOgPP6RpFkKReE6bgd1SSxVeRYzNV28TtDrfV/4g1CQgLNww+EqpzFSliPiFNrbnV
	 xyJdLbdpp7YYkhiqlhJJW04saSGoJgCVuMhKjD1jQE6VqLZqtn9oU7gKb9uzDs/gq+Qrf
	 ALvAyX6J8/WePlv/S3kbXN3EzKVdC7w0q0XYkqmlzE+mgb425xYNWCO/DQosCRbUxBCk1
	 +7PD9bXUW6cPXaDy+k8k7VJokli79BCSJk+9KCbt0hebETxhPkS1ihPfkEt+YB2O+2FcV
	 aNbGoKE32xdUG4X+DMAqRumniiyxdvCltd8Gmj8AZ9ZvgtWKGs7BF/pogoS2dVQmS7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
	b=wmdc1hKeKu/9a8x6o8qPSCPXgs/JYnbu7W0n1laOHtWSw7EfrtXHN9I+M7fJ2QHSt2a7
	 S3T+G2yhWrQVh8R4f9/33GunIxvpJC9nuJlUTNIWhMUDWP+CLSTWMUOEjXdIP4R3XCi3w
	 V5hbkHNpMqBcHJ1R5/2a0Xiewf6sfaZrwTufarngs3/ZF3CHCAxBpGptPH9I4O3EMwQ5P
	 w+T4b3Q1iPYim4xygydTFd/nLv0d6HlZ1MNGr0jXr6kGdcQzKgL4xvr7XZEvxAnCVs/Ly
	 DoZnAR3vNRzM2sVdxIfID/B55dboO2M0C7aCjAG1NWLA6KXV8bS7st6MDRWm/5HqzBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8LBIvfb;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C3B606A6F5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C3B606A6F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8LBIvfb
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-862b090e41eso756647a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205321; x=1795810121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
        b=D8LBIvfb006ggpC1T5ciNRMhgTWR07Vt92zKkdxoByVOzBvHlLsjG5ktXKKSVykZnI
         3CO+z0P+A4kGN7B/edJzp2pFuuaibTqccAHvBoZOIwCwgppI9mWGjJGwgl/BEYXekFWk
         +SpynToJvv4zALSeF91/CrPseDAImGniBvQelIPSi0ysieOvw8AOjiKGQuw598hb4P7s
         zEQclNsCHYrE1E+5RIMY8eA4YT5tPkx7OjAdUs+RVTC+JycxQCfOZk560dtywqM1FeKl
         RD8GtRSRMj2Gao/lz5ShORX/03l4gQN8F74KuMUnx9XqWqn/KCw/kRKb3WfAKY58tF5w
         U6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205321; x=1795810121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
        b=BuQ3SGzOx5oJaDIRBCbBM733kM8W71OfB53VRA92rKCd9OsU0UYt4JqAYdJqVYvqeV
         euDV8VXBubdeGu9UQvO8wNPk4aYUGdIxhYbYjlYjVgxi1eHUrSIJ4Ythpb1iuZIuLkG9
         f3JpO4laLcFelGfV7j+1NwSSzBHV1poFcNQGnTnWB8ryaaHBkzC4qyAMfOytbQosCaMg
         33AtqLf2wgO4xcwmaTzXZyO3wjty1UmVEaDp/FyWDfh21PDR1WTOTqbZOsjXq9ukhdIi
         B6pJms61XgrAajTO+QDszPIMNacRdQEVBX9vA0LY/6hzFecILBJHqaXI8c86RipLoAr1
         +xpw==
X-Forwarded-Encrypted: i=1; AL+hErG/AaLvK7uR8Ww9p9iwjsX7Ey0qjmXcuetSDKzySv5wUIGiLm0o6y54y8nGA63h4e+XvztcqZ08aF7eMAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hdVjCzv/LsAmTHWMr308FaVSIrVZM6VaZEGVvWBwe7qnZ9liL
	OJx94JHNTF/GaPR5gn2je5ZImiNpaD3a2pc9LqcKSu+kR7b/veKZGpNX
X-Gm-Gg: AYBFou3A7jZMdZ+htc6KWoW47vdt8dACvhF6iZT30dLR1TDFvoiyLfhHt/p98arK9Nj
	0fyss+trVDz5fqbem4iKujlJMD1P3VZuLMQ9jXMtBcbV5SPwfp0uKggpyQdJRjzHDDZf/hMnSyg
	gGDUmCcaMfdAE99VJmLogoz/vo/ZM9D12OAWPQO/KXfnjaSEX2xbo6XTPG5hF/Zj1DbQi1s3axz
	CAXwafgEV1dL8sWlUrQF0yHst2LV6dmaMC0stxQn4DFqk5iv5KdQ9fg9DNInDs0YahkMcWonZV7
	ryChWXlcDL2dHDHvr+XIX/2VdfjCykzMs1bZIyJNduk5s124it2fT540JHPWByctCnMNtgPZVch
	CMwOS5HlxdWY7l+i8LMAE5l7NpPwlHzonMYci1pjpHDfsbmVXG7OoCkniwD4ZyGqjG3U4CPB+F1
	RQV7TGRlJFGQXIEwK4SYkJYj93mfs344k+mabkGt7NegPJGozszSlit9iSfKIQHoFCX7w+AF5LD
	W8nPxFRfwjvP7bVVapn0vqxHO5QdaA2PkIng2bon7fEIDO41Jj4VS6w+M4PIa7517fxxJ9XEo7y
	HDjOMqLdhP3lsLEPQT7j695NQGdwzBJgsEuTuct0qbLWerctfenlbgcKl7oQOKgnRdJ97iuxP/1
	yi41tUDJxnWrKmHbuwx3kNMxk37FuREvH4s3MEPK+mmIFeHaXlmZ3Allon/bRCCQFOLG4UOP8ry
	FcdvMYhFXq5p8rviFaLF2V6NxdPxxOYa9o15+2AJN1ts83lTMFnGf1
X-Received: by 2002:a05:6830:4487:b0:82a:bf47:a080 with SMTP id 46e09a7af769-86315a869dbmr5519853a34.27.1795205320625;
        Fri, 20 Nov 2026 12:08:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:33 -0700
Subject: [PATCH v3 03/11] nvmem: exclude disconnected providers from
 callback admission
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-3-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A provider remains visible until device_unregister(), after its operations
have been disconnected. Device matching can still call into it during
that interval, and consumer acquisition can use its module pointer after
unregister has returned. Cell registration and DT fixups also lack a
callback drain.

Cover matching, cell addition, DT fixups and layout population with the
provider SRCU domain. Serialize acquiring the module reference and
publishing new cells with disconnection under nvmem_mutex. Check sysfs
permissions under SRCU as well.

Cell addition notifies listeners while it is still covered by the
provider drain. A listener such as cp500 can register a different NVMEM
device or unwind its registration. Use a separate SRCU notifier chain so
nested notifications do not block on a waiting notifier writer. Notify
listeners of removal only after admitted cell additions have finished.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Link: https://lore.kernel.org/r/sashiko-outbox-219563@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 112 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 81 insertions(+), 31 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 32d36ca904cd..7d75076cda49 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -52,7 +52,7 @@ static DEFINE_IDA(nvmem_ida);
 static DEFINE_MUTEX(nvmem_lookup_mutex);
 static LIST_HEAD(nvmem_lookup_list);
 
-static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
+SRCU_NOTIFIER_HEAD_STATIC(nvmem_notifier);
 
 static int nvmem_access_chunk(struct nvmem_device *nvmem,
 			      const struct nvmem_operations *ops,
@@ -287,10 +287,14 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
-
+	struct nvmem_operations *ops;
 	umode_t mode = 0400;
 
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return 0;
+
 	if (!nvmem->root_only)
 		mode |= 0044;
 
@@ -331,7 +335,12 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
-	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
+	struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return 0;
 
 	/*
 	 * If the device has no .reg_write operation, do not allow
@@ -535,7 +544,7 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
 {
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
 	scoped_guard(mutex, &nvmem_mutex)
 		list_del(&cell->node);
 	of_node_put(cell->np);
@@ -571,11 +580,15 @@ static const struct bus_type nvmem_bus_type = {
 	.name		= "nvmem",
 };
 
-static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
+static int nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 {
-	scoped_guard(mutex, &nvmem_mutex)
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (!rcu_access_pointer(cell->nvmem->ops))
+			return -ENODEV;
 		list_add_tail(&cell->node, &cell->nvmem->cells);
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
+	}
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
+	return 0;
 }
 
 static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
@@ -653,6 +666,10 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	struct nvmem_cell_entry *cell;
 	int rval;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	cell = kzalloc_obj(*cell);
 	if (!cell)
 		return -ENOMEM;
@@ -663,9 +680,12 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		return rval;
 	}
 
-	nvmem_cell_entry_add(cell);
-
-	return 0;
+	rval = nvmem_cell_entry_add(cell);
+	if (rval) {
+		kfree_const(cell->name);
+		kfree(cell);
+	}
+	return rval;
 }
 EXPORT_SYMBOL_GPL(nvmem_add_one_cell);
 
@@ -698,11 +718,14 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
  *
  * @nb: notifier block to be called on nvmem events.
  *
+ * A cell-add notification runs as part of the operation that unregister
+ * drains. Do not synchronously unregister that provider from its callback.
+ *
  * Return: 0 on success, negative error number on failure.
  */
 int nvmem_register_notifier(struct notifier_block *nb)
 {
-	return blocking_notifier_chain_register(&nvmem_notifier, nb);
+	return srcu_notifier_chain_register(&nvmem_notifier, nb);
 }
 EXPORT_SYMBOL_GPL(nvmem_register_notifier);
 
@@ -715,7 +738,7 @@ EXPORT_SYMBOL_GPL(nvmem_register_notifier);
  */
 int nvmem_unregister_notifier(struct notifier_block *nb)
 {
-	return blocking_notifier_chain_unregister(&nvmem_notifier, nb);
+	return srcu_notifier_chain_unregister(&nvmem_notifier, nb);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister_notifier);
 
@@ -795,6 +818,10 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 	const __be32 *addr;
 	int len, ret;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
 
@@ -851,8 +878,11 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 	if (!layout->add_cells)
 		return -EINVAL;
 
-	/* Populate the cells */
-	ret = layout->add_cells(layout);
+	scoped_guard(srcu, &layout->nvmem->srcu) {
+		if (!srcu_dereference(layout->nvmem->ops, &layout->nvmem->srcu))
+			return -ENODEV;
+		ret = layout->add_cells(layout);
+	}
 	if (ret)
 		return ret;
 
@@ -874,6 +904,17 @@ void nvmem_layout_unregister(struct nvmem_layout *layout)
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
+static void nvmem_disconnect(struct nvmem_device *nvmem)
+{
+	struct nvmem_operations *ops;
+
+	scoped_guard(mutex, &nvmem_mutex)
+		ops = rcu_replace_pointer(nvmem->ops, NULL,
+					 lockdep_is_held(&nvmem_mutex));
+	synchronize_srcu(&nvmem->srcu);
+	kfree(ops);
+}
+
 /**
  * nvmem_register() - Register a nvmem device for given nvmem_config.
  * Also creates a binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
@@ -1034,7 +1075,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_destroy_layout;
 #endif
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
@@ -1047,10 +1088,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
 	put_device(&nvmem->dev);
-	kfree(ops);
 
 	return ERR_PTR(rval);
 }
@@ -1063,19 +1102,14 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops;
-
 	if (!nvmem)
 		return;
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
-
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
-	kfree(ops);
 
 	device_unregister(&nvmem->dev);
 }
@@ -1115,17 +1149,33 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_nvmem_register);
 
+struct nvmem_match_data {
+	void *data;
+	int (*match)(struct device *dev, const void *data);
+};
+
+static int nvmem_match_device(struct device *dev, const void *data)
+{
+	const struct nvmem_match_data *match = data;
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return 0;
+	return match->match(dev, match->data);
+}
+
 static struct nvmem_device *nvmem_device_match(void *data,
 			int (*match)(struct device *dev, const void *data))
 {
+	struct nvmem_match_data match_data = { .data = data, .match = match };
 	struct nvmem_device *nvmem = NULL;
 	struct device *dev;
 
-	scoped_guard(mutex, &nvmem_mutex) {
-		dev = bus_find_device(&nvmem_bus_type, NULL, data, match);
-		if (dev)
-			nvmem = to_nvmem_device(dev);
-	}
+	guard(mutex)(&nvmem_mutex);
+	dev = bus_find_device(&nvmem_bus_type, NULL, &match_data, nvmem_match_device);
+	if (dev)
+		nvmem = to_nvmem_device(dev);
 	if (!nvmem)
 		return ERR_PTR(-EPROBE_DEFER);
 

-- 
2.53.0

