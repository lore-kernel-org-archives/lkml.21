Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116342;
	b=5ARNEPOmUa8GG9wMaEQaQhYTKEMDAd7U5K/6LklYI+8HiHZXpFUyKdQKcjKqbaUDJz9n
	 3SapV1nKPSIdggEFc/2R+Xr9ODaFr29NF8Q1G7sI6CWLs4ker6KDDzJO/3gPw14nM0F2r
	 WUEJm+o//Y5HJo97y6sN0YUvkDl5Lpy+ln9ujoqzogtHxDvAhLvsU969sSDKhk9vTOix8
	 hrU1t/d8uD58EQdYKGHho+K5F9m9B+rsTicBwg134geO3GdoYIjdi5MoC5xxxFAWbWsEK
	 hXEEWvNP4w9SPhlUnpkVgpJc0ikiMC/rutBcsoq3VQODdOWyX7C1vnsnvbKySzQseMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
	b=vGeSOeWnzgj5DBZ7/vooF5B1kS/p0tC1VcD3HhnVrDbuahVgfIPWIZjjpEkaJ5Eb1ZDQ
	 9ie3UkUOIZ/Bux2vcsM+bCfcoCq46nqEDgC6mhVdKl/Hq64K67qEwCQhTgjCA3E7z1yK2
	 VHgNc7Row4iNG3U9dSDbjE4wBBJ7Q8xFxQWedQN5Ghx0eo52N2Piyr13OCDc9lYQWpG3S
	 VrGGy1kvEr9iI9DsuElg8fsXWLgbzm+71q/EwFNKKdK9+bgVkplOGNVmWlSJLe/25gLRp
	 zQPm9mOjxyjHCeFZiiCqUNe8EtGxwFRv5Ax9LlRpXQcN0szSqfP4WsFRw5wRsOUqvZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BYv7OsYs;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF3606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBEF3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BYv7OsYs
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f022026e60so597205ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116341; x=1795721141; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
        b=BYv7OsYsxwh5t8p7/0Bp+Ty/T8NLWmSWYXIktaSg0QLh2dtAIFb3imVoee12XgHoWK
         mUIbJT1XkyoNa7tb+YibdljLhg8xyJpSz4cIDdCeOF27j0B545vrSXDsPWORMWkYK8lL
         2ud8bRh2hgMvWXbTuM+9Kmcc7s/hrRwyihUtOpStDYOfj2AtLGFx1Bu0icOsfO63qsRy
         ZGhxrkwNxvyV95wcfNMtY+9w7/r9tW4iBrIDYIwhqf5FSLswSImMzmz/v7CszkjOwRfu
         ayIbn7J6MZ6LABK9vpuCF081H5sl/Q8ZbGtbOEXMdSp6PCg6We/dTvPKV0t+kKCqx32J
         bOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116341; x=1795721141;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
        b=oHcwAwhx0DuX+zSErOHrtflG0sHatJnAFA8/k3A4TmfAkuzW8CmH/qutcAlIUhXd5t
         znqk2GPPQq4IZdFiMlElUuAfzND3NZtxQoTQqJrxT5a8CYbuxkHdZzhVldO/QLIvyIBb
         TBnowL2UHD3L9dtQxEQ3EUA5UeBL2hgz9PsJYsxJA6KzAWayHpSAt9lHn2jcm/KS7gid
         5+Qu62kWfI3Zinukf7Cl1Oxnf1iHptFSUy/Qnd07vV5vZzDdwYwwoADXIkDUeVDwvzAq
         fLeEPpW+YnrF9v/FsMpMUg3QMKcPKoFSuyntYM9BbbzKZFAXOmeS9OxC8pvldLhtaBOD
         rxlw==
X-Forwarded-Encrypted: i=1; AL+hErFnsLNorkwokGJ9kE+OL5pBg30ahswN6cAKbl0xaeCEDrC50SsroS+0hWl+QnMfMSvpxgUHbdeC1t82w6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XI4VmQJzmnsUDfEu08v8L5bdIrDB/eETunJffSwAQd3kuALmM
	zapm47/eQ99HHekMO7QGx2BDrayrI5uXPJMil5xRnd05gCMNeM6uqbbwSVMslzpsn1rcHPodALu
	gmftRB0zymA==
X-Received: from pleu15.prod.google.com ([2002:a17:903:41cf:b0:2ef:d860:1c85])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fda5:b0:2ed:fb0:bfd6
 with SMTP id d9443c01a7336-2f031e08699mr15736045ad.11.1795116341051; Thu, 19
 Nov 2026 11:25:41 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:14 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-4-irogers@google.com>
Subject: [PATCH v4 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 908a8e09113b..f33864958487 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops = {
 	.store	= sq_sysfs_store,
 };
 
+static void sq_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static struct kobj_type ktype_percpu_entry = {
+	.release	= sq_kobj_release,
 	.sysfs_ops	= &sq_sysfs_ops,
 	.default_groups	= sq_sysfs_groups,
 };
-- 
2.56.1.708.g77570a6a1d-goog

