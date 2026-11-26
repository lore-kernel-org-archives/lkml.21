Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685282;
	b=2WoBpUVA/FpGQxXYhsXIL0/QHOrXw5fmmcpr7YZd17eN0vTNWK5/qBj3KfCsFlFXjh0t
	 rlsJom3BFNuq4BuPYfDGcAqpLkTlJj0TOQVvZzxpRjKhAzeQGockg/jtnvxRS89EWUbXM
	 s13CxNEaiaaa355woEiFnwP2akg2fVC0iyEEFORYxtTxTzREOvyV0Q7fW9dRcEYVMLeRT
	 MKvhWixRFD7n521u9ykuph/UV4pj6v3ya4KfNMGkPyrV+C9L629CSMdngpjT4b27js1Wq
	 Z7aHLII6deVeoSDyydgcFlaE7F5hOE34p7mkYOynPBh6GAbcVCyZzDT20lBrRP4Vzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T1rSRkzl9awRiglIgFpbzWob53mrf2jMTVjGG4JCJCM=;
	b=sfxkbGwqanpK4dlEXq9Sh3KHMp74eKsI4z/2q5WH36LUxUl433NDy7bKdaA1V/SNXBSN
	 1nALknpDSvXdD2y2EdJu5nvEC+PdcEId6hmPbQ0abp1ZzUfbYV4SjuCqtuY4clqXDd9TX
	 0fw+od0PZLMjMdieRAOxVO5TrhpX4kumlLXmXxjlj69ByZTXand7qx8jq1FNShtGnjSD+
	 NASBm5aDgyFZwgxqbUWgKIPa+pLSVYPbQ5Y++63PZCt7AtE8qcRpevCVfyS+RLK09Rui9
	 ynFIKv0oaMOTxIjcrGUB0CTrkOo4qiLen/wljDyVSh+IdznvcerAQzPT1APCTmlSUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SihxB5bK;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60656606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60656606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SihxB5bK
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3913232f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685281; x=1796290081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1rSRkzl9awRiglIgFpbzWob53mrf2jMTVjGG4JCJCM=;
        b=SihxB5bK+QPJHxaaKBfNka4GcM1M7hWevMT/+d19CiGwXlvqlqntuFDsEmK7kGMJoF
         ATR3EBM5cQZQwa51XfXjyq7fC0UPYZBnoob08c4EhbSrAF6aVG9fpOSx4qSX3eOsIbeA
         KcPGEE7wiaIO9FUpT+QTyV4LULNcxXH5mJ/6c6RQeBaNqHHMmQK3kWna/HxXJCEUIcX+
         6KmjAbB4ifpQ5jAzuoR5lzKnuX9RfTzF/QwDGj/oyHju/3HhaFb8g9oI3YVfn3VJMM8T
         qytU8NiShO2ZQwBwBwLNGrbRXe/pfFZ9Fxjx+eBqYFxD+G+p4qFeRvyUmyBYpy5HqmMX
         DVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685281; x=1796290081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1rSRkzl9awRiglIgFpbzWob53mrf2jMTVjGG4JCJCM=;
        b=QUbHHtKs78IKUz4t3yMkIf9HV08UZPjOyI6vFtBhByGYPxoOIbYr1fuLyKyKRY6RrM
         UAMN1TTh0EoRN3qU7o/LM4C+LbTrIyeGyR5ZyUok/M2ykJhrkNRZRvzsqG7gBchBXx72
         9hKsYc0tGq2pRieoegBE+3FCexfMVSkNe0eHOCAnTU/HRFAXMvRB1tPpw6I/F+D/HJQA
         ZJeiE9YuAQgWdZ4c0oe1ESzVhgL7fIGbMAMpbrSxUgPbK3dYD7xv9dWM1uiMeRx3/7Tq
         ZwZtdcGBzUD+ZqLyM+ffLjWOVj7T/p737Q0oG24Tc2cTh36J3LwPl3Leh7UPzx/qoslf
         bYHA==
X-Forwarded-Encrypted: i=1; AL+hErF5OceQ3yYi2wOitYb8hzRYnQkUUxTsOv0GpJDpi35orc1eSOKM0tWjCU7z3XVdNRGr/kDE7v3hOSjfkuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yBmgKaO2uXSIDh2uq2jn8C9oSO1QbtZszBe0fG40bYYfBK3wz
	Z2FZgK9uCYn6i2It8/ImYbMKdjqVC2dVZTN2ZEw+Nko2qLCZGAPr6ZWE
X-Gm-Gg: AZFdTZfsd6SLFMBcG3OeO5EIMOnNy0wvusmWl1HzrpKWMQFSR9lJdmnDGVWdPvBqBCt
	cfwr7yrrYZzjI6nhgK6ks6nNopRkGGJ1bKqADVQXfU6hd/91rmOFdRzSl+fdXIBFT3st1GzljrQ
	OxU2GbzthFB3UAHyGC1RGTHswYihJRCF4N8Dc3osNjTbPxZvZEPP7QNsfrwfrLxkRb5WRltvVzz
	FzH+elAOSnX7C44U242YcIakhOpzv+Cl7OfMSVDg7xUcu4ZrgYS25RBBH5+2cvAqn8R1c/mNieL
	9yxxnR2QTFnMvm7USFwGJdHs99czBmUt7vNA2JNgz9/Wi4LhJKG4wsWxVK+H2v2qxmMeiaIWp+w
	nkNKA1iQ/fXsxnr3kPHBYyxl/0k4cwkl68E1ykjibHr3wLeobxkxa08d4zLvfpHXZkPIO09x4oO
	I+6qJVcrJKWaNpEt8Fv0BfkeiovRgExQCID1WaCAskXxrCbFcNBJGC3+RBfeogTiOPlZRAKMjH5
	jIteGPoZr4GSuuSF2xA5ppxx0X4sjDKeaP4M//6qUroaFDapkxV0xztvZgPO87SOy4FFBp1iWqS
	FhN5WiRTyOu9P2nzGQbDymXv03HiGXnUQ/Hw5MB+JtYgxtk=
X-Received: by 2002:a05:6000:29d9:b0:48e:bf0:30f with SMTP id ffacd0b85a97d-4abb2910fbfmr28308833f8f.34.1795685280415;
        Thu, 26 Nov 2026 01:28:00 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm45387870f8f.14.2026.11.26.01.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:27:59 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: josef@toxicpanda.com
Cc: James.Bottomley@HansenPartnership.com,
	andrew@amutable.com,
	brauner@kernel.org,
	jbingham@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergeh@kernel.org,
	taherafahimi@linux.microsoft.com
Subject: Re: [PATCH RFC v3 21/90] fs: seal a mount namespace for a cell
Date: Thu, 26 Nov 2026 12:27:49 +0300
Message-ID: <20261126092749.2894153-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-cells-v3-21-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-21-bc9095937a84@toxicpanda.com>
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

> +			      ns->root->mnt.mnt_sb->s_type == &nullfs_fs_type))

I don't like this. nullfs is multiinstance now.

First, we have usual userspace nullfs. Then we have knullfs.
Also we use knullfs for marks: https://lore.kernel.org/all/20261002-work-mount-cover-v1-2-232a8f52b43c@kernel.org/ .

So, instead of "s_type == &nullfs_fs_type", please, check that this is that particular instance we need.

I think check should be such:
ns->root->mnt.mnt_sb == init_mnt_ns->root->mnt.mnt_sb

> +			/* Whatever is on top, now that it can no longer change. */
> +			while ((m = __lookup_mnt(&top->mnt, top->mnt.mnt_root)))
> +				top = m;

Why not use function "topmost_overmount" here?

Also, why we need "root" field of struct cell at all? We can simply call "topmost_overmount" every time instead.

-- 
Askar Safin
