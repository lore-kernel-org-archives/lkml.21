Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106559;
	b=aTKXYmBWzDrFpjNkr/YQSyv9kIioa27kd5+LwiNXnqvu8uz8bNAxGrWzpPjYaZHN7CB7
	 Xi7fMC/PhfCLK6yPqKjwpMivB3vxsPMisUJg/4qBOgOqi4WnIYJbs9sqVe6gqbnfJ7IyH
	 w70ojVVZH0+5gEEXiTvukOnOAnb6QMcyxQEppF/Be/d69kf1wNAXa2I7ddMwgWU9dHd9f
	 C1E8RKDorZGF/ww90+wEHIE/qckCyFGL63zILWgK4dCRVL+YY9LXBvvEQjeFUlntjRzYi
	 mKJ5SYalFNYAq1AfGoTgFjtM7E6dQHQVxUl5sBhSD5thVQGaoVReDIHhUW0ObRFYSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
	b=VpSAH/mJND7Q3rYcLdhBksbAXiitz24c5XDEIl3769oYQMMnWxN1sljN9ei/THaWbRll
	 GyQKkH5wUVsFOhclGzGZc2bp1yDfFEFFHyxAV5+/tnmV3l2irJP/r0AnDGP9AoDOfuAJY
	 ei/OVlUyXhJd0vkj96Iy6WnKDicTkth1tNWbDoozC5VN/qRrZ7I+0S0wg1rROtEKTvpeG
	 I6F87C7XNaKSMcsS9kRlqFsudYa/oeHL9oVZRVANnhmVXWOc+mFsv9tXhfWU3TtOuTpoc
	 OzZWEWEM8VRMajdcRuEB8Vl27xYmc3Qah8hNpf6NoZ8gcdEVvuhju2SPrssz1hpTU0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLjyivwc;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCCB60A3823
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCCB60A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLjyivwc
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71af0656bedso1610093eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106558; x=1795711358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=JLjyivwcOntTLCXp1jxiSe+QmKJVEOCy6vrn5rj1QX/HY7QYerdbuYAB2KfeSpoumJ
         sbjS+BbEfw3pqtdHXX/+fKQFVtTI/khQqd+zMCbsDR3U+XqA254ZAypd3LjFWIKYF68o
         dbouu/z2+/02U5z2Gi6aB3O3T43JEkwKmf4X0DhRR1c2e6BKvbWWnzmIOn2DbMU/IFp9
         cQ9MnNbMXb1cjWe3GWYQIhCQPgns6X2pCvlh4RmKWZu8Zq/eBNfIxLUzcwiqcjACa2AM
         WYJ3ZRzxyVFwg8V0nJe+ovuyb72tDR0EuNulmrgW1FnOTygmHCHRpKRr+1noK4G7h4ua
         Uarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106558; x=1795711358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=A48iZZJ8PcGSZT/c6BW78L1+1gOlA5RzPTs5kX6ZZVIKLpmr/H+iioao89dMMrfhgv
         xTgxqNOX9sivhh8T34PNuhhrj1TkhdafMvAlPQV4ZcD4ikXJIIPR5iAMHAnEWo+2t1+B
         p2GG3TOpRWonvnM3zzWytyR3EmSo0Ioguz6xuubMilMsQdBh2akWhGG391XObjXzNviO
         /oizlR8myJUWJWQfmdeDeWWEHKAxgyAKkZX5IoiGtfskTFLlZl6y0TcRLw7nHLcEzG2h
         Eeen8YvEF1bv+BgnwmIECaeSCG6eNbVW9yd2+SOVI7kZoDxThY5x7fAaFoHCKRVrn0Bq
         6i5Q==
X-Forwarded-Encrypted: i=1; AL+hErHyGwPAXXIAYPCXw7/VFP0Ns3yiBeK8wMgwWbTWFcjWPRBDnxz5U9H+JsbJAyYK7ofDnrJ7HU+FvwizMKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87CJ/4Fps7SIyI7di+zDe5eLZUP51j2E66xPlXqOWRiqI9xiPf
	lG2zWZOZ0TsVVz3Ph/IdijcZqozGVVsLu4ddTGwbYWMdHI7vZfmx4k1g
X-Gm-Gg: AYBFou1UdnhQmSKsRqK7uJG+7d9MbrhiQNgB/+DIJy83bWrzRbC4bFySbXmUHtUasUa
	bZY6zUfWZTtBuPcUFGPxa70hBZGmdyrJUI9pFFiEDU8wVDreP27F7Cyhx8vlv/+8sZH8iyvzK96
	Mq1zv5Eka+LZMC64BmaTo1s/VcHHT9YAScqHnfgcrNEWgw6pdt/aUup8A7XZb1Pc0LRHf83Gkvq
	3SWZ1l5Ghr/r744bnCyosa2Zdg83jjz9LRobTucB6uZkxNdeoGoC3crzwB0kKarnHPrfLyjj66+
	KBaZ+nXJccl5DA3/uYXbm/XPTK6ZJNoiOn/cK+1DuHgv7zJK2lW5d58MIWBHd2UveNZzEwa/8Gy
	hdLd18nyv5KJg7tYe4xf5ca3KiR9xer08aAqpqPTdQucj7JJ+xfFezxUl+tIbbi2BtooEpiOJHl
	7n6xr76AMZvEiQVwDuiqyWJprz7IkX4whHAl2m5woSfgmlnPADBqm5W8TIcfDibjxkZs4Aa0XE+
	6Om2q+6H/UAtCC9KsqQHOkBipemqHi9yhiptr9jjks+OUUZpUQucskLn7OKWo9MZHQ+P59to+99
	fGpbF7ZYr7cGU33pDb4+OhUM/7JFw1qUU3szjjfQzU+07+w1mgjxWmN+OFzm6xgW/f/LQCYaIs8
	CNJiJsDPzS1vWjwMQUmD1NSVYgfI4uCSLlQEZwnO7ZKUJz3p+m9Iy2MkUU4q4TS15ylZGCGacKL
	mlTxSlkPmyZ1iKXcSStIbm0yeRRXQtYQNXxqgyu6+fsTveM4h1V+w=
X-Received: by 2002:a05:6820:c5c1:20b0:71a:ef8b:4765 with SMTP id 006d021491bc7-71b394b825fmr83275eaf.47.1795106557798;
        Thu, 19 Nov 2026 08:42:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:07 -0700
Subject: [PATCH v2 09/11] nvmem: disconnect published devices before
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-9-8fca3ec5f18c@gmail.com>
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

