Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795349366;
	b=hmJo4oy4j05TCkx5nXIbAmXkbtjnrdYxzYLo14J8tmqgar/NrO+xsyexa/Sy2jAxX1w6
	 Cq3M7JorijxY4Y38X0QP34gc/HhqxD8g9/uPoRG/CEFf0xDD6IOMJlXL2uCDoHWE8HRxE
	 cEtuL/Qm5nOb6UoVP3XC/xPWMg9w8AdThtvnZTlb7YOs2JQLUQrUZ3FmQ2JeBhiJjWmzr
	 fgUpa0+FCBIioDZqm44/gmL4wDNO0irBEKjNb3wBJgdO0WdO/gCiZYOaMvFGKnzfGWT9f
	 udFdHrzFwtRYYzg3SsdA/nm12rcNQF6clL51Cbou4H4GX/qYItjhkuaxNGTGs43vxoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795349366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vo8KO2KJ+xe5NqcgWpWn5sRi3V4otNrp6pD7wdiaeIg=;
	b=mNFA7lXUhMZQQCFz/rvfqHkvnKJzGs3dykPS/dJNYXI6ayRkj82Kytf+rMzVp6Bje7bG
	 AMAQG7D7ynZdnu9Qb/GZIez6d8vvaEN68voB3ZmR7JHXAeFlu4DpOtbTcH5uw6lYWXDup
	 EXikFZBwRzLIZ4AnnCFgFsy3dmut7yDaO2HoZ86uqyOoEKlg6oqz3Nck99ULvxBhljZsG
	 I/J1kUgrtjEZxWYW2xThV/NpLN2UbOeejJmm+Vxu8bjNs2W/XY6znAyAsOKuczfDi6DV7
	 BtO5hv7PLw4q1HeXIAimSKES2VwxBp5Cmu1lzpqTUDkiVp577RAEADBkUN8axFE9ooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Iv2edekw;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DD2606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DD2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Iv2edekw
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c24619b19so1810470d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795349364; x=1795954164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vo8KO2KJ+xe5NqcgWpWn5sRi3V4otNrp6pD7wdiaeIg=;
        b=Iv2edekwCcVIQp9JIMsfLhk6KtoiV0WhRuD1FoDIRhUZsxLA2kgzsksYDDlnY5NdLj
         QTmbmISW8g0su/g5+BFFz+65uDTd6p7xZ4n5+iHa21Cf9mBL/0iwxOGqjUi2dR2vr9+O
         UyN8+2lSQ4KEgbwZTJIMOzO7HpzYQW1qneGMuVKZHYveD1XscsYYGBp1JauYkNyuMvpb
         DQ7lS29jTR8iypzv1awMBPRFuN0pyyKlUiDxvXF8n04RhcYHVGPSRlpXAdX1TW/U8O78
         8HbEkFnVxM2h4kREUrWn+N5bIMsV6ge5D3B59Kkdro3yg6DDF/VJptuL1Q4Aj+GXRvTl
         WGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795349364; x=1795954164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vo8KO2KJ+xe5NqcgWpWn5sRi3V4otNrp6pD7wdiaeIg=;
        b=SA/0aw3WTHoC8NZ+KaY7RypHFw0Hiyic01kDndEa0DP5Xs6MBCa88MEGaWpcAaQmQr
         gRFZI/9tOJKfm7HNZJlxqQI4BikjMd0YiX8yVMCkeu9vUvos/HGeM801iwjmsae4P4cD
         Yy00CfwHdDFO9DpSUtkvFR7Ijc2Kr1YtK9Bf0CaAtODKaUaw4F0QWcuVmlXZI91HYmWt
         J5Pw8KOuSMJG1ymURYuPIkKhnajFQXcQTTlx8TTo7cK5swUG0IWB7fcWbFHPfpuh9QgP
         +sbdlu28zO1HblP5HFuTGLfymgKWRLzwPQAH/IeV4Itu78YMlzweMTKwT2yhc+1fPpC1
         oNJQ==
X-Forwarded-Encrypted: i=1; AL+hErGvtDUuCSAXvl1yS56HrDQ2AR0qdQXIqf+3BrJ9xouQQIp+/usV8T7pPN+haHTydYRl1k4qlNeX+XlItnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yQQ5SgyjMY/L13bn1092UYIGqfHUJhppGIQHINvMHXvhkIHoF
	JwqCsp03LP44xqNONzxjzApHGvSyZUDmQbLuJmNfLVGdMJgXOh0a7gyLFxKfoTKdUg==
X-Gm-Gg: AZFdTZe6kpaD/S1vnKBI3ZrTPL0pYfq6HKiUVteYfuhNkEJmFKBfbLyl426eWiOnWyV
	QyLSFbXLYLsz3Xp5cH5QmIMJhw16i/N7jyr9is/ZDzWXmZrcYGjV++8UN+2jaHTKpwqGbcdnnVH
	ata65VfP0q5lxnBy2i/+QLzJXhWukYt0TeMUe9d92WYHgnXry14ELzfOSORaIQck7QytMqdTz2z
	orZqq+MjxR66X8mW73qJtUND2tLGF6je1L7peLvQOWZ7aGu+HKcQxm0rqICN190AXvgHWo3EVL5
	GQvmKhRWHA/hGT8/V1RqAxlrTtAtm+eXBWUU8lF6sQTOK9xRYMZKERjQ2wJHkOU/TbvOSOnJjLH
	DuarFEHjBtgLIXj3Ihu3b5rEY8Vx17C6TH07DOiRJ5pBgCVXY6ug5lY84jooMjVodX4UwRDommf
	7oWd/nP46RQxyFJI2VYxq1b1yzyxI6hmWOP3feilgAxcCoa+R6JDllihpOSrdDvT2jw7L2RVyux
	o09iJ59p48laldvSSgdGy89N3yBTBjkEZ63U5fMHIVfyE1RZDlWNfiw9ApM38mV5DjmG4ZA5yDI
	lf2SQ43zpg6XKlTXBNtGAVJ4o91/ZaCYJGrtZp/EksAXKFBdZvYg
X-Received: by 2002:a05:690c:6088:b0:8b4:d26a:aa7d with SMTP id 00721157ae682-8b5204ff21bmr37330077b3.56.1795349364614;
        Sun, 22 Nov 2026 04:09:24 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201ba5absm34801557b3.4.2026.11.22.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:09:24 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Date: Sun, 22 Nov 2026 07:09:19 -0500
Message-ID: <20261122120919.1718445-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 333c515d1896 ("vhost-net: allow configuring extended features")
added VHOST_SET_FEATURES_ARRAY. The ioctl reads the number of feature
words from user space and checks that every word above the supported
ones is zero, one word at a time in a loop.

However, the loop has no upper bound and no scheduling point. As of now,
a caller can pass a count of U64_MAX and a pointer into a large
zero-filled mapping. The ioctl then stays in the kernel for as long as
the mapping is readable, and a fatal signal is not handled until it
ends. On a v6.18 debug kernel booted with preempt=none, two such calls
from a non-root user, each on a 4 GiB mapping, froze a 2-CPU VM for
56 s with soft lockup reports.

Interfaces that take an extensible structure from user space limit it
to one page (openat2, clone3, sched_setattr).

On a KASAN kernel with a 1 GiB mapping: before commit 333c515d1896
("vhost-net: allow configuring extended features"), the ioctl does not
exist and the call fails with EPERM at once. After that commit, it
fails with EFAULT after 26.0 s. With this patch, it fails with E2BIG at
once. A reproducer is available on request.

This patch will reject counts above one page of words (512 on a 4 KiB
page, or 32768 feature bits; 128 are defined today) before the walk
starts.

Fixes: 333c515d1896 ("vhost-net: allow configuring extended features")
Cc: stable@vger.kernel.org # v6.17+
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

Tested on the vhost tree at 44293796526f with KASAN and lockdep: counts
of 0, 2, 3 and 512 words still succeed, a nonzero word above the
supported ones still gives EOPNOTSUPP, and VHOST_GET_FEATURES_ARRAY is
unchanged.
 drivers/vhost/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 631855064b3d..22e06b44d2ed 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1795,6 +1795,8 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 	case VHOST_SET_FEATURES_ARRAY:
 		if (copy_from_user(&count, featurep, sizeof(count)))
 			return -EFAULT;
+		if (count > PAGE_SIZE / sizeof(u64))
+			return -E2BIG;
 
 		virtio_features_zero(all_features);
 		argp += sizeof(u64);

base-commit: 44293796526f4343639f87b2acc53811c78b5d54
-- 
2.53.0

