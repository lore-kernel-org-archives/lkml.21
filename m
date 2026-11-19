Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106553;
	b=A314sBfLilX80KeTOCgyp+9/rCdcGvoxzaB0FMfLtikXbmmMPXFE90C3pOY/c2cfELgV
	 vsrThUFNpEkZFitxOVGKXa8xacE50eeEsFxf4d0GZnga5gLSWPJCE+UCnxxA7qYyLkE6n
	 fagHTi1tIKNgQdqQ8yJxPepISB2KbUJmnh5y9V1nOBJBPrVuE1pU6R4rOuV4AMDy2Tofn
	 xOZZy3jnoAh3DGo/UUGeVyM/YaGze4LiyxMNGLSZNZlcuBMU+/IKN+CiPI8z2D8LMFnPU
	 0MUgW0GFZV8sH4AYeo+1Bh1yXhT9EeXWGRLgTkaqEwpcy+7pZxX5FkwoCcSzpwKHYkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
	b=lNNFmbgl0S2Yv5G6nJFlQO4hmrqVQ24KRDa76uTJreikadk+pQHrSs/TKM1kEeTPNzdH
	 0HyHtuwLh5amLIqtnQEhdi14n/ukXpEOmRPAXlXMHEjLgFbZKePBbSAT8Wt57hZ5fIo6a
	 WNlihIszOUaGGy5pOSIMEX+Hmjv2PABD/Y7vwt+EiGq05usl77Mr4BHAg331URa7ML0Ns
	 YN1phAIrYBVPtUIKwJDHtEy/ykXewOzshr5ArPArVugkSLNUXbmK9lSXjj+olld3iCJBr
	 lqs4aNLWZ+wXVysDQwHa/wE/OXjejvSoroKI6tk8gRHvdYiwnrQl9rwONGhI8TAp3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ldz0DSAz;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15760A2622
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A15760A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ldz0DSAz
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71b30ed75a1so459865eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106552; x=1795711352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
        b=Ldz0DSAzuViR3A8moBAmBflsJ98gL33Eb7ftxIr7/YrLDal7OcnEEca0n4Ri/RkUMv
         AE68zHlkw+n04BWm6+LcJUVAlv6Z11gEnfWmiKmO+CNf7Rr+++RrguCTgNOcgJil3hhO
         fsjERI1SQavAKbqwfPvecAghoVqrebV91ZSUDbdrmViCnptpb3lUh10uhpeUmPSiJq3q
         /t9SWnlSrjLKlPXyJrXa24ArUm4LlZ5yUBtnVK/sbW/q2CXs3R0Kc9iw9MwKbK7yXlux
         Blt+9Izr2ylhpmDU59bvdjaCV/Hx0KPfOJOlY55NsjvOQ+GmVlazIT1y78bd/8dyR/rl
         ZBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106552; x=1795711352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
        b=gkM8erhAaFivD1gWF8Mx2bKE/CbM+XvZ6uny3AWVjE85JKaC+oNmYOj/W/0EHmteUx
         csLYa3RxtvNYTB4bQF5MFgcelZI1euJ9sSIJMM7TF8NJBApyY2b65qpqWOAsUQY8G2Wu
         Wg71Prf0lW/ThgUwHE07EsmAf8TeQUnxb3m+ghBlr8EJA0jeU1kMS8ZqvwXDwOFaWW0F
         ryRWhCVFZKzX1tx512q6ut0AyV/Ase2K8CWC85tcRLBU2zJ17yw6Db16O/WNcFKsqbm1
         MrABH2KBuCVH/xFgxx+XmtkxTQeEgteyjKm2ura3PsLpSP9KaBadDGBzGIik9KEFuiET
         3Dcg==
X-Forwarded-Encrypted: i=1; AL+hErGN1Ck5jruE5PMxCaJuyIXiTfJI1TQoYHhon4htkSYKvyySs8YaGpdXVe4r1Z1Imtvj2lp9FsuUCktGym4=@vger.kernel.org
X-Gm-Message-State: APuU4Z98lKsWeDl/SWu6GxHyobN6plY3/vr/vd+F6yVPzcUQ9mx1rgPT
	178FtnzSmkV5TgWcH9ITBtSspBagTwZGopmEJ7g/dcyGhIX2lLFD29Ig
X-Gm-Gg: AYBFou1gAow4rwB5Sh8tPzm0iWnSi7cb0QNUOFhzqXgkNbwAyOMS5NFqB7jS7TO1FYu
	eb1LJxAL6CUwu7mKxOI+9g5C+HUPBsNUpHfgG7xSKwvEg/HsuMGSPjED5o2OJ6gjXsJSi0jGXmp
	5OWVO9LRC6FC9K095USMwXfpOBXSbvQBGMTpBWtqvAXEwiBrTjMttrlyPajGC3p3vA2Mv646+za
	3WQYCTGk/t/iaa827xDqKI/LGdAHTiU7Px+wh6KpKeaQ1g5XxM/lvohB/hp1b3Wye1VD0lzoZhh
	lC9AC0YtfxPr4+ClsQ5kGk0aXnpmqGvKnmUmL67iRuQgYVjS/Q65IvRMFe3mkmtDRCn/6EWENib
	AFbLKQ1RMglSrapYufTsvdLCTIUVYue/zGSnCgaAw9O92F7ddk7ZOOgsGRSujET4mpcNKbkN3Yr
	XFq51RTtdxcyVkKLYL5DE/vsp3wy5RSs/kzr5mudHenG/a0ywcyoPQZn2OoY/BLOoXjl48xzEgO
	vbeqqkILTp+vPkrkkw8dXTx3cVLXrNmpY6vz0Jy4ILwNT4AlWrlp4cGUnNt2gN64Gr1f9cqiQpq
	cEc9pNzEEnkOzvSQITVUpDu6/5urwUPyx/taWRaHhT8ByrfQisnOMZrSahHosl9jOvKYzK0RZpj
	fCBi2MEybjL+rjgKSPsIdMHxzfYGcfqHmHLtsDLvMfeCVUFxdkuG/Scjx5200x/Ko1hP9nsPxtp
	xHA/Jm2/78tNqc7g1xiC1epr+RSygpZPhhkhAP4KDcKJnRVenFnOo=
X-Received: by 2002:a05:6820:2088:b0:71a:fd4d:d61b with SMTP id 006d021491bc7-71b3948872fmr119563eaf.46.1795106551814;
        Thu, 19 Nov 2026 08:42:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:01 -0700
Subject: [PATCH v2 03/11] nvmem: exclude disconnected providers from
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-3-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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

