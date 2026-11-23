Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443403;
	b=jDJQopBrTfMzjuFhC61pWCm+RfwF+TB5NF9tM79jTar+9m/aEYnpp1OaSqmr3Fnnf4F5
	 8WDFvGcnyKfOe2u7tLkxpGLLyngmMIodZCAp1geXcuIjdT8eoBUS2KGylbprjxqA9tz8x
	 Qe6p7zNAdZnVsavQ1Hzk2ZbRwjG3+65+02Xkys2HpIAOOj4PNGjm0dqnM3IaANwCYGU1Q
	 va2CeQdQRB+xWe5BqYfG9kApacNF7Zw/crdtZ9GqXUZxfr/sJeCY27ExP5xvsOK/F3bG4
	 wW28Jjflva6p/IVXpzrQTmv1E+GgfLNKlWhZQa2LRHZH9DYoSTeIlgISmCjHF4k0wHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6MB4ylRBWhpP977K7CxD8OdJrbMU3UJuzSG35QAoRMs=;
	b=owX/14/hpVH9FPk5tweV+A72VbUMWzx5tFQjboR1omdo/2ph2acCYyIO8gv+Gfo9/eHy
	 cOqOI8fS5txiwXiHMEgq5XGgS/asDqMiBVJmbIGWKIX/xL/S31yubgKCOOdX9hpAkOSAU
	 9TMs/2pgAMkWRvZ+O6xNypHdWRxXq2cqsxvqh9Lasnd9DJEfCWgGl1/p9tX9A3agpMe3K
	 oejs0kk+20anUNfkrhIdi7kVynxAIZqhhxwDIad9mgXBtvUByIeawhAnOLhZOpdzZbVDc
	 eJ1vc0FBatd37i+b2Y8J/wcBSw8aulBgbolqMhmG6Y9Jsa7W4+TaXDUqYFCSFmLDAhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcNvIfBu;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CE1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcNvIfBu
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3119639c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443402; x=1796048202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MB4ylRBWhpP977K7CxD8OdJrbMU3UJuzSG35QAoRMs=;
        b=WcNvIfBuosWOK4cGqzEjxYWmgvMqRbD/6GngIbnWgsHxnzAsrHyWPslnSHSkLwPk6t
         KhwakfLlqu+5UggWBnom/2zhfHmbAswOVWFMjtr8Guer0caLq1wf1p7w8K95QkaE/MCX
         lgXy8eTvtb4YsQMzed32QE41EnQC88iNvLQmgmXt9Gpqo3dmjFfrp5ka7SJ0F4gxjANx
         l433z2r0zO8Vkyz5q8qWpZeiL97K/ZqdSZrUvkzHQsry7IfCYbpKeL4/KLCWtUaR93/c
         6YvcBGH/KMMwpOJGmoZKbUekq4eo5Xgs6+5PZukMRIu5PQ4fir3Ka8D/6QBqlG7HNy98
         nVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443402; x=1796048202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MB4ylRBWhpP977K7CxD8OdJrbMU3UJuzSG35QAoRMs=;
        b=zQDiFJBOVeehFbQmprEB4O0G2kzV1FDb/0tpqKpGmGjR9BtHFmkLhAf8PB8Vzecz9A
         1PWvA5oyMCnl/HatXEXwpReb807h6BEHm7Jw0VAYuV9JwtnDIikAvnQfsLpU02q8ySW4
         63TuQC2d/C2vVohbR6jl4nu0/vmNVea2Deb6io0sYB35EMgyKZTRUSS2vef3m4ItyOxs
         cSuabs88h55M4ufj68zoImpSwTkkwDFeQ684s7eYpzJ5QFhMeyMGGCPD+HC4qJhMTs20
         VeQmmnlxUOTVpqzBc6nF18zOqBxvIR13ScasiD8L839DjjfkRCSw/cb7OWoOKsko984B
         hm4w==
X-Gm-Message-State: APuU4Z9lOEILsYk/jOCUJ28E3RWc1DCGkevNkDEdkJztCcEoPNdzmSxS
	2dVrADDm0pCSKp/SzBnq3chfcvnu66uN8xrjl6UTUwq7v2t5rkozU3/2
X-Gm-Gg: AZFdTZfUYQlEtpGM8veBRxt+uFpWHyi9jdMXzzbF3BSI6XE9clcW0iwO5938t81CDbH
	Uybx/aSpe19x/5jjdJ6ksWY0/D9ttnpnPNOnXKZjSNCkG6fm3LKo66fP9aTRTYWXfq/U8YCOIk6
	acOVVmp+y7Maw81ffx88IEQRNeEWsSntsvxz45qddtuM1ByHH7HciTMcAzePV3DjwSS8bzPsUZl
	viZlFkZxS0Fk0DvXGqjCy17i06GBnSIJbub4R3ReIbrfdWoy1dqlJy2fbZwro5BehPO16R2y9qC
	C7hTx6mj1E/UG5hY99D+eeJ8xpigM5F1Vhfm3UbbV9sx2LuBNfhjs1cCbLVUAjreM2b4Nt+Tk8o
	M5FSiDQlpgMyGm6YlrgYAfwZxxyz5QRHOBp6rVnS2jv2rYVJtOcBf5QZiPRSVKAdEJgo+f80gLA
	sLPkLGi5y3mMQ1yXPSTKTDX04SeDE2xIz1FnBoEJv9FRZERG8jYccnOpIdDLr/jH6G/dTx6odY/
	bhHQPIj3Z6cMxE+XSQlONqtfEQnQeNvh4zV2ZD+kgzTOpeUsLlgreshw6HGHgfeCQjWUgxjSe9x
	CbI0kpRdwCuC8er1hL8UA1/LidBJ4jjzlKWGO2Vks5R1L8HGvReZQM/gO/82KHbFsN5U14YwikU
	=
X-Received: by 2002:a05:701b:240c:b0:1b5:7111:5c4a with SMTP id a92af1059eb24-1b571115c94mr3404520c88.26.1795443401226;
        Mon, 23 Nov 2026 06:16:41 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm28642799c88.8.2026.11.23.06.16.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:16:40 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 04/19] mm/swap: introduce swap device iteration helper
Date: Mon, 23 Nov 2026 22:16:31 +0800
Message-ID: <be6ef058f4a6babd3562270daa5b61c4ff9a6a50.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Separate iteration over allocated swap_info descriptors from iteration
over writable devices. Hibernation lookups require SWP_USED and
SWP_WRITEOK under swap_lock. Take a single snapshot for each flag
test, since unrelated bits in the same word can change during setup.

drain_mmlist() only needs the atomic usage count; walk every
descriptor without loading flags there. In si_swapinfo(), count
usage only for descriptors that are in use but no longer writable.

Move the live-reference warning from __swap_type_to_info() into
__swap_entry_to_info(). The iterator must inspect descriptors before
applying its flag filter, including descriptors whose device reference
is dead; entry-based lookup retains the warning.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swap.h     | 12 ++++----
 mm/swapfile.c | 77 ++++++++++++++++++++++++++++++++-------------------
 2 files changed, 54 insertions(+), 35 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index d488a69c2809..70fd3ab655ff 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -108,16 +108,16 @@ static inline unsigned int swp_cluster_offset(swp_entry_t entry)
  */
 static inline struct swap_info_struct *__swap_type_to_info(int type)
 {
-	struct swap_info_struct *si;
-
-	si = READ_ONCE(swap_info[type]); /* rcu_dereference() */
-	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
-	return si;
+	return READ_ONCE(swap_info[type]); /* rcu_dereference() */
 }
 
 static inline struct swap_info_struct *__swap_entry_to_info(swp_entry_t entry)
 {
-	return __swap_type_to_info(swp_type(entry));
+	struct swap_info_struct *si;
+
+	si = __swap_type_to_info(swp_type(entry)); /* rcu_dereference() */
+	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
+	return si;
 }
 
 static inline struct swap_cluster_info *__swap_offset_to_cluster(
diff --git a/mm/swapfile.c b/mm/swapfile.c
index f22197a6286c..56b75770d320 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -106,6 +106,34 @@ static DEFINE_SPINLOCK(swap_avail_lock);
 
 struct swap_info_struct *swap_info[MAX_SWAPFILES];
 
+static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
+{
+	lockdep_assert_held(&swap_lock);
+	while (*i < nr_swapfiles) {
+		struct swap_info_struct *si = __swap_type_to_info(*i);
+
+		VM_WARN_ON(!si);
+		(*i)++;
+		if (flag && (READ_ONCE(si->flags) & flag) != flag)
+			continue;
+		return si;
+	}
+	return NULL;
+}
+
+#define __for_each_swap(si, flag)			\
+	for (int __i = 0; ((si) = __swap_iter(&__i, flag));)
+
+/*
+ * for_each_swap_info - iterate over all allocated swap descriptors
+ * @si: the iterator
+ *
+ * Context: The caller must hold swap_lock. The lock may be dropped during
+ * the loop body but must be re-acquired before the next iteration.
+ */
+#define for_each_swap_info(si) __for_each_swap(si, 0)
+#define for_each_avail_swap(si) __for_each_swap(si, SWP_USED | SWP_WRITEOK)
+
 static struct kmem_cache *swap_table_cachep;
 
 /* Protects si->swap_file for /proc/swaps usage */
@@ -2284,26 +2312,18 @@ void swap_free_hibernation_slot(swp_entry_t entry)
 
 static int __find_hibernation_swap_type(dev_t device, sector_t offset)
 {
-	int type;
-
-	lockdep_assert_held(&swap_lock);
+	struct swap_info_struct *si;
 
 	if (!device)
 		return -EINVAL;
 
-	for (type = 0; type < nr_swapfiles; type++) {
-		struct swap_info_struct *sis = swap_info[type];
-
-		if (!(sis->flags & SWP_WRITEOK))
-			continue;
-
-		if (device == sis->bdev->bd_dev) {
-			struct swap_extent *se = first_se(sis);
-
-			if (se->start_block == offset)
-				return type;
+	for_each_avail_swap(si) {
+		if (device == si->bdev->bd_dev) {
+			if (first_se(si)->start_block == offset)
+				return si->type;
 		}
 	}
+
 	return -ENODEV;
 }
 
@@ -2470,16 +2490,13 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
 int find_first_swap(dev_t *device)
 {
-	int type, ret = -ENODEV;
+	int ret = -ENODEV;
+	struct swap_info_struct *si;
 
 	spin_lock(&swap_lock);
-	for (type = 0; type < nr_swapfiles; type++) {
-		struct swap_info_struct *sis = swap_info[type];
-
-		if (!(sis->flags & SWP_WRITEOK))
-			continue;
-		*device = sis->bdev->bd_dev;
-		ret = type;
+	for_each_avail_swap(si) {
+		*device = si->bdev->bd_dev;
+		ret = si->type;
 		break;
 	}
 	spin_unlock(&swap_lock);
@@ -2996,12 +3013,14 @@ static int try_to_unuse(unsigned int type)
  */
 static void drain_mmlist(void)
 {
+	struct swap_info_struct *si;
 	struct list_head *p, *next;
-	unsigned int type;
 
-	for (type = 0; type < nr_swapfiles; type++)
-		if (swap_usage_in_pages(swap_info[type]))
+	for_each_swap_info(si) {
+		if (swap_usage_in_pages(si))
 			return;
+	}
+
 	spin_lock(&mmlist_lock);
 	list_for_each_safe(p, next, &init_mm.mmlist)
 		list_del_init(p);
@@ -3997,14 +4016,14 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
 void si_swapinfo(struct sysinfo *val)
 {
-	unsigned int type;
+	struct swap_info_struct *si;
 	unsigned long nr_to_be_unused = 0;
 
 	spin_lock(&swap_lock);
-	for (type = 0; type < nr_swapfiles; type++) {
-		struct swap_info_struct *si = swap_info[type];
+	for_each_swap_info(si) {
+		unsigned long flags = READ_ONCE(si->flags);
 
-		if ((si->flags & SWP_USED) && !(si->flags & SWP_WRITEOK))
+		if ((flags & (SWP_USED | SWP_WRITEOK)) == SWP_USED)
 			nr_to_be_unused += swap_usage_in_pages(si);
 	}
 	val->freeswap = atomic_long_read(&nr_swap_pages) + nr_to_be_unused;
