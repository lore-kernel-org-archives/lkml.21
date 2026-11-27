Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754560;
	b=ITk8Pi7WkWU2Gd/Unj2HvxTsEoSJG5qSjbtA2op+QJmKjb5e2Rer3ElsswB8V0bbxpDQ
	 c4Fl8uW6IfpKh+J7k3S5iFePF6xkSE1ExurYKBemuROujEoiR46IvSFZbtPRw+EVR8106
	 Tujcm2rwj/MAct8aB4wQkwZfkq26xnsOmVQA1WCzr4cWIUsw0djFHHF1ux8Oljrhw9tPA
	 q1OUzemHnK0Mvz5k2zFL1bkPiu+SdGoyzTtLUYXVV6mwztdEVoIvPGpPtFUNxJ0p6ltLE
	 rI0fDvCB/LreNFGmPJyN3+LerHV8WVk86I9FbDkst76SAqBXxY76aCdIcpJQrqn/L+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O+rRy4P6l76sAa1MEvxT+ba2Q/e9qo00pznd7HSYHvs=;
	b=QDhjMduw4jJvy9QSr8b7aUxGNzVCpd90B1maHW7T8rXfv9gdkmlQqTU3WzALR0zBc3ni
	 a+BkMbjg9h4wwWMfYPDPexSvwBUCgWqD7d6diMeXlAWBJfw1nvHjLQdBK8PJ7rYmvwXBV
	 coBaILlHwvIZRLBUHNL+6/6TX/rFLZWSWdaU7ba7IzIlp5mAXeZnedzUzeD0Gg7jaaZJo
	 pzVe871mwtkDCJ14DkIM1QqIj3Htxsvdr06E/wW717UOu+D7A12JH1esvpCtgyBfdExDi
	 XsU3WM9FwJennzKBY6lwFcWDlzEv2I198BQGh0et0YA3xsJmxYoi9l2+yne8zqzeuNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhS6ozDP;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B3606A6A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8B3606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhS6ozDP
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6615932c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754558; x=1796359358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+rRy4P6l76sAa1MEvxT+ba2Q/e9qo00pznd7HSYHvs=;
        b=mhS6ozDPw0xYFfopQc8kDYvw/JnIC8yS3U++lNWqI6ZDp1Miq+acf7sfLRwCEp61pc
         MzrEjaPe6e/WaQ9JdTaikph6AW2oXIEODb2SnWF49HrdNWoKf5j+VZafi1grskaaUewN
         syogsrHpvTajLE0Z6V3nygXn3Pg7JLuusxcCfyopNUkVFQFRmmRX0nGmRBe88Ji7ZblA
         n6ts1HkXrV8NiMGQ4kQJ+g8tbRFfU/i/twoMnXhBJYjvnwLHgkwMFdiRiaHwHFXRS9/F
         EuNpiPXPXjC6sHBfETq98qI8Y0NXduwaNXUHNkMPLfMIAjOnoQlzdhFXpWbonA/Z85rI
         IDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754558; x=1796359358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+rRy4P6l76sAa1MEvxT+ba2Q/e9qo00pznd7HSYHvs=;
        b=jHpXjEuPF//iepo9KioJ2sLE96Ln2tvCM9b0IoyYrsRKp6ROBKrjcti5yaa23CyLtw
         fpjaDh2E9nSeyAr26AYeV0IZUG1xUyWkBqctoCxQPpPsP4tbvIj4/dgTOJ69bLDKbRQw
         M6hAjsllyRxVTDrvS82OuIqaEG+utDZASkVkmjurrzmq54Sky/n/dqZ3Et0csuv3G+Mc
         3/UZ3ckV47sVAvlmOD6UhUdrmtTAeKqN3D8HmaHywP7qhCxphpOl/8lcm8HYmK5zrNpb
         rlmmE8pvgASR8kN4icf+fMBt3jHjkrhheK/RN+NIXgIygL8iJkqJ2kkfl0HsuVgjFwzZ
         6Law==
X-Forwarded-Encrypted: i=1; AL+hErFjm71HH5oDIWzqKkiYCSO9fCrrgLtLwv6wSWeef9z2edgCqRClHsGSf/ENcMMWDu9wuEwbsymO81rr1Gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BNRW8pAOaAiYHUDSe4P9bZz3E3p95P4kXzqX10XkXJmDNgP8+
	btptusPRTDJH//uwkVmtHuALPVlGeBbJHWqGxYm2fRF6RAp1jRvvzf9p
X-Gm-Gg: AZFdTZf7ugE4EgVcxfql6S11T6v9TncB/D9HKg7OrL5UEcgLqEXnEuZJmPXHxZt3q5a
	a01uEBnwBxjht3ujBmfC3tJO6Idp8MSsS2XL50irAV7fS22yckandzAI8EydYO3sr6CaLy538fT
	S2ySbkhqsjtSJtOOQrLHoukBxuLvSg+FzjdlBhgJQ5LgMLdLyw/GaQHGYEeYOr2bKI3bpQojw00
	fCVThdfwpJK/KWsAHrndUScXxYyVFu17Awgqegid7UU1IQ7fuqvP3yrCsyECQaZ6Z0JQp7BT90G
	XFzvGDT0KXpORPyMqbXGQVZZUeEvavAOIJGqaxgQOYw9E+y1+ChCzwNTlZHB/KHrGBruB0a2o90
	Kz9dBziVy7il1xM0ZxWMw/Du4HH9NweiqxTMRgUUJXaiPzp/JXwgzJm+k68th2eHvukB9PONC5o
	iqV0Z7Zu3b8sO8XlUCsm2g4S/CeOWwRXbUCVoR+7Hl2KNGrYXWXb5ChS9nUea0gY+Z7ZKFIfYkt
	4nJpcE04bu8t0v4JjFJmvpbLytk8Evqk6jiyL8AFFcIjjgmV9q+p4UCr5Q8+KY7Mdty/6UhD3Da
	+nutNWPDvDYJ7gJAhyhuLhABsBsSOS8fobIX05HYtF5+xhSg8TFqyMRwnY50swI=
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr22486415c88.4.1795754558553;
        Thu, 26 Nov 2026 20:42:38 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:37 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 1/8] nilfs2: fix leak of gc inodes on error
Date: Fri, 27 Nov 2026 13:40:54 +0900
Message-ID: <20261127044231.37630-2-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
References: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
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

From: Wang Jianjian <wangjianjian3@huawei.com>

Zhengzheng reported below syz problems:

NILFS (loop5): disposed unprocessed dirty file(s) when stopping log writer
VFS: Busy inodes after unmount of loop5 (nilfs2)

The reproducer called ioctl clean_segments on a corrupted image. It's
first argument is { ino = 8, cno = 0xffffffffffffffff, vd_vblocknr = 34,
vd_period = [0x30000000000000, 0x10), vd_blocknr = 6, vd_offset =
7,...}.

nilfs_ioctl_clean_segments
  nilfs_ioctl_move_blocks // gc iget 8, get one inode reference
  nilfs_clean_segments
    nilfs->ns_gc_inodes move to sci->sc_gc_inodes
    nilfs_segctor_construct
      nilfs_segctor_do_construct
        nilfs_segctor_assign
	  nilfs_segctor_update_payload_blocknr
	    nilfs_bmap_assign
	      nilfs_btree_assign_gc
	        nilfs_dat_move
		  // since there is no dat entry for vblknr 34
		  // (entry->de_blocknr == 0), return -EINVAL
		  // fs will be remounted to readonly
   // clean segments loop will be break because readonly fs
   nilfs_remove_all_gcinodes
	// since nilfs->ns_gc_inodes empty, it
        // clean nothing

ioctl_clean_segment will get one extra reference of inode 8 and when
segments construct do GC move vblock 34 and do bmap assign, it lookup
DAT table and get de_blocknr = 0, so it return -EINVAL. And since
nilfs->ns_gc_inodes is empty, nilfs_remove_all_gcinodes will do nothing
and the extra inode reference won't be released.

To fix this, splice sci->sc_gc_inodes back to nilfs->ns_gc_inodes when
got error.

Note that, when normal files add to nilfs dirty list by
nilfs_set_file_dirty, it will got one reference and when
nilfs_bmap_assign got error, nilfs_segctor_do_construct() also doesn't
put the inode, but as a last resort, nilfs_segctor_destroy will do
it(however, it doesn't clean sci->sc_gc_inodes).

Fixes: ce5a5ad1a833 ("nilfs2: fix infinite loop in nilfs_clean_segments()")
Signed-off-by: Wang Jianjian <wangjianjian3@huawei.com>
Reported-by: fengaojigui88@gmail.com
Closes: https://lore.kernel.org/linux-nilfs/CAO-4RZ2=4okHYZ-xCkpV-ekj-aSqKLnYGOsRM9A2dD8R4Ozzeg@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/segment.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 68b640a7aa5b..4c2d51f6550c 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2586,6 +2586,7 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
  out_unlock:
 	sci->sc_freesegs = NULL;
 	sci->sc_nfreesegs = 0;
+	list_splice_tail_init(&sci->sc_gc_inodes, &nilfs->ns_gc_inodes);
 	nilfs_mdt_clear_shadow_map(nilfs->ns_dat);
  bail_unlock:
 	nilfs_transaction_unlock(sb);
-- 
2.53.0

