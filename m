Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944318;
	b=PnS7LbIPQtL6wToXWbN3xfiHO+3J4xD43DmD0OavAF7SamTiufTB9J5t/0ytPq9pErlP
	 K2Ig+k/WaA1loFqzTPkllSrcJ9SJtW2Y+hVdBtLd9SsV8heRhvKj0sVbXR8vALQGtNRK8
	 W0Mxys3BaVu+/+q0/ArzkVPaehTQ3hPO2Fdmz6sdSj0NNWrv+kwxKRzRpAThr1gJMSj7p
	 KW8CTtQziQgQxmnJ3AiZm5YK2Evhr8NJZDZM5jJ82y3pHMhI/dQo1Xsm8qfgWwrE768NJ
	 TkiZv88ePSfi5ySwOOEmq4mRAfREcoNRK9D6KeyAoxIIaG/jiHhlo/yL3ZSyE5zN0+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ark13/PyXZ6Z68o4079LEbmv4Z7dIMRuCxObn4ZXF1U=;
	b=osY0uMrqUVhOnxZP6yElK5+rsWlDCplAIH7gh0UxzGZrp0xOha49U7ixqaY4dKzoN4oL
	 5Q7VyqV0ZzfUsxWqGFv1jn8FQ0iF4Lwlxs9u3DhkJ9U5jt9XV9Zc7QjOaE/YCg2VXIArs
	 uwDlrc+0RSjVaqU7FtQOuO4HrjX9rMN75lZBK5L90q+7Tl7wzqRbmfwwIr/wgNmDR6mEy
	 uKbmRLStGUl9mtkhG5EM+A/3bPVRKff98Njv/48jsxU+nhLYWDip6o1Ca272WBAtELlhl
	 ozbJxZHS9KrnGQrxQGnHtDMvSImtrsrBCYFHvQNHcOtXDI8Nu4Xh48TA0vl7dt/4ssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LN/zbATh";
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F1606A893
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093F1606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LN/zbATh
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71aed54d4c5so142773eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944317; x=1795549117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ark13/PyXZ6Z68o4079LEbmv4Z7dIMRuCxObn4ZXF1U=;
        b=LN/zbAThYB123dhM5QRPSYKhH82e5m5M9/edirKHoYbvFwR2IB/aZudhZfJv2glYGx
         ogXNllK7Q6Ny8G9WJfklgObq3pTnZ2iH7NYRl7cT319bzM6t5ftLGv7CX2n1kg45StGh
         Dgfc8xkwhQWBx5Q0cANEVebpWOyEciPfHNzri3QFcZ6R/fsg1Z9r7doaZoWXoL8yf45L
         Xw2DHszT+quDcFmQjnu3zfXn9nIZ1fpSC7HB8AuO3MRKtToZHP3S32JohoLcCHg3syT+
         YAN8Xs32uvrXidBbi4y9XfIjNxbpE1kmFlbpy7moyNKtT/w+/ey7KEqVW5V+NOCupqck
         +P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944317; x=1795549117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ark13/PyXZ6Z68o4079LEbmv4Z7dIMRuCxObn4ZXF1U=;
        b=hg4SUoh0mJtcYGcXleYgPBCbKNGliaciLH/B4yXPgD61KswGQ91TUo4lgcJn/XCKnJ
         RV72JAww264WEcOh335d7H3sgGbLLyFEiQV1U7g9iWTXuYo45DymHGiF53CYNsBW1x7t
         1IwxacunjIHDbe5AgmW/o/HMVGaBUCo3uW+olZGZbqC7exrJxE4kUQVuwSB7u1x+kGzV
         WMxaoaEYb3M+iMmHjbM13v8+vJzsJID9yCm21uXel3YYTrfLaojdLLhr7eLYQblDXmL5
         n9+EAOeZDSha9IzGSoHhz32jY4NNsovX9aYN7ZtG+Lx6c3BRDeBMZduj7iUQVpQEF2EO
         7Z7Q==
X-Forwarded-Encrypted: i=1; AL+hErEZrcnPCzGAgWzhaox7WvgitSiJHrXjwI3EVROgLEcyFJfTCDAS2TB5ZfZDH7ubF5CWb95+9UcIGetf3fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gFhq/7P4OMHXwuRV1FqU2Ia6b7yTW/C6H2utgTpOlJYbanX4J
	rLBWvAZDFS8LmFU+eLQVtDvSGdISfiDaN+OeCTpiNYeogZnR6iOJ0IPxuqJM+A==
X-Gm-Gg: AYBFou26cb4y7pPBx7YKmQxsoqHj7Qc3s/g/QwDjtYR4koPEeuSHD3l7921Q55So6Kc
	x3f8fsNqob4jmhh12lZXokOBPwEjHUbwXQaQjbhlS64zJdm5CC+fSeeAOZOvDDj7yZQ86XTtVIB
	Zwx0U0ZC8kXD12djZrS0lWT7iNoHJ4Z2DwGGIyBYYhz/68JSD/GsW6LwC7VGGtv7syLpoE4j00+
	yCQ2yd1mvQ9g2gHn74De1nqlX5410UCTjztbEVdg5ps8H4I7rWn67VT2d8jeR8t+Z+kVhTh+8XZ
	gNQbC5lvMyBpM2pMyCqvQeTusx+uMaCOlYXs2jqhqpe4daI4a6ZGXCF5eNKvmDUO7UOz6vf027o
	4qN6Akd+6q16KRb+m4LsrjWoNLuGcM5wJjfB62QfVPfqjh9GYS5wGBygP1P4adLOxjQHktavv9V
	9PV/tOQFDc1+CP70joU6Biz1HvAbZIk0PkcjQ9bkQZNGd2vBhqOE0zukOFr+Z1TXbhd9yjmHo55
	1DQyIJ5g3vWFK5IUpEjBJqr0kAcE8bRt6NSiRKjktPFte76oEK6z6/AzGw6xN2m2vMFKnJ7H0Dp
	GTAaCUR1a/FS4v9kbB+/J1ZX+3ESeuyMrgqJMQyQqwh/PdT4RJelLuCIqwGGJJNUp0RIfob8KkM
	ZG+P7rKkqiplhaAdQFBB6oldrlmd/ye++gME4f7MUy1J012G7Hm7te8tMRSEkHi9TDGZ2i/zD7x
	kytlxgqKonjKrOGGV5Ug+W+J6tQ/OYJKcbRijtIH4J+YOT7k+Ph9I=
X-Received: by 2002:a05:6820:1343:b0:6f6:1e3a:6fc with SMTP id 006d021491bc7-71b185aee89mr308329eaf.79.1794944316957;
        Tue, 17 Nov 2026 11:38:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:12 -0700
Subject: [PATCH 05/11] nvmem: reference cell entries independently of their
 provider list
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-5-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Cell handles currently borrow entries from the provider list. Give each
list entry a reference and acquire another during lookup, before releasing
nvmem_mutex. Return that reference when the consumer releases its handle
or handle allocation fails.

This separates cell metadata lifetime from list membership, so a cell can
be unpublished while existing consumers retain its description.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 65d89498edeb..70b6126886d9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
+	struct kref		refcnt;
 	const char		*name;
 	int			offset;
 	size_t			raw_len;
@@ -54,6 +55,8 @@ static LIST_HEAD(nvmem_lookup_list);
 
 static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell);
+
 static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			    void *val, size_t bytes)
 {
@@ -562,22 +565,30 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
-static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
+static void nvmem_cell_entry_release(struct kref *ref)
 {
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
-	scoped_guard(mutex, &nvmem_mutex)
-		list_del(&cell->node);
+	struct nvmem_cell_entry *cell = container_of(ref, struct nvmem_cell_entry, refcnt);
+
 	of_node_put(cell->np);
 	kfree_const(cell->name);
 	kfree(cell);
 }
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell)
+{
+	kref_put(&cell->refcnt, nvmem_cell_entry_release);
+}
+
 static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 {
 	struct nvmem_cell_entry *cell, *p;
 
-	list_for_each_entry_safe(cell, p, &nvmem->cells, node)
-		nvmem_cell_entry_drop(cell);
+	list_for_each_entry_safe(cell, p, &nvmem->cells, node) {
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		scoped_guard(mutex, &nvmem_mutex)
+			list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
 }
 
 static void nvmem_release(struct device *dev)
@@ -695,6 +706,7 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		return rval;
 	}
 
+	kref_init(&cell->refcnt);
 	nvmem_cell_entry_add(cell);
 
 	return 0;
@@ -761,6 +773,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *nvmem, const char *cell_id)
 	list_for_each_entry(iter, &nvmem->cells, node) {
 		if (strcmp(cell_id, iter->name) == 0) {
 			cell = iter;
+			kref_get(&cell->refcnt);
 			break;
 		}
 	}
@@ -1408,8 +1421,10 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 				cell = ERR_PTR(-ENOENT);
 			} else {
 				cell = nvmem_create_cell(cell_entry, con_id, 0);
-				if (IS_ERR(cell))
+				if (IS_ERR(cell)) {
+					nvmem_cell_entry_put(cell_entry);
 					nvmem_device_put(nvmem);
+				}
 			}
 			break;
 		}
@@ -1433,8 +1448,10 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	guard(mutex)(&nvmem_mutex);
 
 	list_for_each_entry(cell, &nvmem->cells, node) {
-		if (np == cell->np)
+		if (np == cell->np) {
+			kref_get(&cell->refcnt);
 			return cell;
+		}
 	}
 
 	return NULL;
@@ -1533,6 +1550,7 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
 		nvmem_layout_module_put(nvmem);
+		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
 
@@ -1646,6 +1664,7 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 	if (cell->id)
 		kfree_const(cell->id);
 
+	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
 	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);

-- 
2.53.0

