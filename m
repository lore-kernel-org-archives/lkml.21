Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205330;
	b=1InY1o46O9XV6xtZU+5h3Hkf5dVV9dpKTC4AWMnES59V66TSy3RnKo78wfzlfVRIWtl7
	 o292VDWQlqMADlH7mahV4jcRVLxixJVZS0CyfTp1P3ebnJv+avdBktLz00vBpYeEpSPqw
	 B74bzsae1cJ6n/Sef0AWFkk409kZAQuAFwsKuOtb+ahrXoh/SM+L+LviryTEffgtuhJBB
	 RM46OzuWFIU8QU+cTuPl7pMO0omfWP2fQ+T4fAnlpmwuyGvgOqLr8m23Hw185FXS9iJ0R
	 QISN6Lx27llWk+AaNaeUhYK+0M4WDCogC3/s7cJWJNrkdsQagtPHr/vRtgcCW4510hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
	b=3MYY3fhFt2oJyHoUcQ1koqbD+dIQWp4A3I9IrGEqHqxPb6kNgrgUjTSwxRX+nuw7mnnG
	 m5t1hVT4G+AUoLh4QkQmBykciQe9Kq6NZqJkZlSwDJzdLQ8y0zkVp7FWnCOmPaZWR7Zcc
	 ZlZZzhHNk+bDWaqis4VFi8yLOWKxzFQ3au/GdY6HmqDjv+iI0vdd2K76bdIz4bIYfZf4I
	 9Ivr5l38ZhpXG1+nmTheFYM++x/2lgITer444IaPVg40CH/30+4dEP28KmTIUskndzs0O
	 CFknxV5W/fRgB49R1Bg+Kmy+w87gfKO7h9ULlj91riGHRPQHlCObZBHVt+yfqRCq/aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNoBzILa;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55660A2624
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB55660A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNoBzILa
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8479f46ecd8so547131a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205327; x=1795810127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=nNoBzILav4RY/rN47Ijj9OeJKRWvlzKENGPTBNKyiAitE6cNLORuQgW8Nc5neYADS7
         JTvcipg1smYxZM1rqC9W9RY8WTg0lXj22ex3mGYD+DjQZTzk8KCftgasbB/tPyvX54bJ
         Oq8kJMv6Z84EvBbHnTu+yhZ9UmV141wC98m5CUyvM7iFoh+jk+3LdeSGCSTj6P7rA22r
         UrWcBWyrhSqGsZElItl4pICnCHn5HZ7nX/0aYcr5uyluipYl+f+k+vRPa+vJiOVZ1zVD
         SizeqUO4K3qVJMNEmBYQCoeuM9TYd7W+ExO5rJgxwt3mAgCnQNaxYByx0d2EuIProGaU
         J6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205327; x=1795810127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=BKxhTkL96Svw+s38gMtrimNthBLiPUQvJkbDHCO1BEdpgjzpO8TZH38lTzdVZTPCss
         pl9+64OvTLrMrLxjkVJUjcX9kJ7xe4gB0NgKjp/0yL/iQRAMnFRhxWyQF/MRB+qQiiTc
         0Pwh4B87d8WsDaOy1ArkrgLwvZTlW5SctJoWjpcXprmXuA8Lw1nC7CyFJJWutAgJ/syh
         27CkT/gZqcJN4weqARchttdiR+WSKwO5vqgNvEquPWvm6PAIHCRUG3eK/VOR0f41tJXF
         tcg580PfiBPNEpD9X9iFp7LUSMZ5dC3fafSQQcXU9kpwqcnGM3Mij5JIHJckDxUrjfxT
         gzfA==
X-Forwarded-Encrypted: i=1; AL+hErHqEk2XHSOP3GBID/cPB9TOls7T6utt8R3YO30vOU2kPjq8aIf6p3pX3+Fd85jqjYvyVBFoIo4x4q2VGXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uR2Bps6zYRHjzuDTcOmdXOIYdz2rX8WPUiD2myKyYrnFwN6MA
	rIKS8xw7weVr1IYp7qUsL/kzhpeL4mpZSEvEteiJXw1O8TKZYpq3n2Be
X-Gm-Gg: AYBFou1MfveHUNWhYRIF8OQtpmaBIRD/8riUk6euz25O3h2WfUgC4+mZO67M8W3IjLA
	kImzvNs+LjPK9jv2JNdRe+oH7IDVsCwcibhIY6m4SU2NjRglFp8wobaiLiKxzeH8mywJOUcJWTa
	2yEzOxvRy3TfoOFrm5PMuBmSFIE2YLHXe1gRWrKhcL0VvtoYI46D5o6Fyh15+dgwGsZnTUpXT9W
	0E1V0WnADLEdG/Z/3R56SWEqr8Gy+PKbYRA//DHhLEfOVzHsjBOr+WWKQqV1o3Kg1xSPVZb3ExI
	JYnU3fM+5PXZKYs6gINFNPegERntFeWynjdiD7PCcxH93Z50YGGbrReLKQnV1syShP1tefcDLeM
	AjzmCv7tkhJWbWv0cfJzWMA3p0DYmecAYPi6K7D8BcOI063dnaMESjcBMVPvaS/BGJmop+T5jgo
	SAy+6Q7PNE5+W5fbGZHgIhyWeka3lLIZO0ExQ4y4KpZmKkm4ushYS4snF8PN+ic7OonetCE/mdw
	yUXmTHjuspoZSKK8DX9JUZdm4RPWp0pmxmAG5qx5uirp8T/2/kCjWayntFzC67hstg4KA6PYVCf
	gO5abGUugeCyJMpJ+9VVrm54NfAPJsOwK4Set5niTqRI9SYO7BtAcvDsrRNbpZ49sHw46P0MF3v
	QojoWnmyofLNsu/Z2K5X7r44vQprz6mL2BwQBDFbAYmLrhBcSdg2ha77OiH4uQMIJJ3iYYgLeed
	fv+eVTxqXMs9x50ULms1XHkYLC7GCuKRCfneugsQumOLnpi6CwiziPgKK+RGCaci9d7wsaWq1gV
	A==
X-Received: by 2002:a05:6830:b14:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-8631595facamr4891000a34.25.1795205326803;
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:39 -0700
Subject: [PATCH v3 09/11] nvmem: disconnect published devices before
 registration rollback
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-9-523610652402@gmail.com>
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

Registration can fail after the NVMEM device is visible and a layout has
published cells. Disconnect the provider before destroying that layout
and deleting the device, just as for normal unregister. This prevents
layout removal from rebuilding attributes while rollback removes them.

Reuse nvmem_unregister() for failures after device_add(). Track whether
the registration notification was emitted so an unsuccessful registration
does not generate an unmatched removal notification.

Document when providers may release their callback state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 22 ++++++++++++----------
 include/linux/nvmem-provider.h |  3 +++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index edc2f61e6e0a..e878931f375f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 #define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
 
 #define FLAG_COMPAT		BIT(0)
+#define FLAG_REGISTERED		BIT(1)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
 	bool			disconnected;
@@ -1181,7 +1182,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
-		goto err_remove_dev;
+		goto err_unregister;
 
 	/* If the device has WP GPIO, default to read-only */
 	if (nvmem->wp_gpio)
@@ -1190,20 +1191,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #ifdef CONFIG_NVMEM_SYSFS
 	rval = nvmem_populate_sysfs_cells(nvmem);
 	if (rval)
-		goto err_destroy_layout;
+		goto err_unregister;
 #endif
 
+	nvmem->flags |= FLAG_REGISTERED;
 	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
-#ifdef CONFIG_NVMEM_SYSFS
-err_destroy_layout:
-	nvmem_destroy_layout(nvmem);
-#endif
-err_remove_dev:
-	nvmem_sysfs_remove_cells(nvmem);
-	device_del(&nvmem->dev);
+err_unregister:
+	nvmem_unregister(nvmem);
+	return ERR_PTR(rval);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
@@ -1218,6 +1216,9 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Stop and drain provider callbacks before returning. Existing consumers keep
+ * their core-owned metadata, but further access returns -ENODEV.
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
@@ -1225,7 +1226,8 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 		return;
 
 	nvmem_disconnect(nvmem);
-	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+	if (nvmem->flags & FLAG_REGISTERED)
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index e0638bd50d1f..ba11c807593b 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -107,6 +107,9 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Provider callbacks and @priv must remain valid until nvmem_unregister()
+ * returns, or until a failed nvmem_register() returns.
  */
 struct nvmem_config {
 	struct device		*dev;

-- 
2.53.0

