Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409394;
	b=J68iXmaR78PAJ0avvz+OUExHb/Od6dECLn5N1fEey2dynN7rLi6t51ho3uieIA0Jrjk1
	 H9eSCdbkSWOL8sjqwI9lrP25SrYx2tld0GTzDejogI9fJN3pjALG2EbDo6adXv3VMqtAQ
	 RHjwTxwZKihiCGsF7vKfWRTVqkvm7vIkOKAVCK0dP9B+ykWq6A9cXnfyx7no7nPPBZNsS
	 VhTpAglvPan+v07mSiiS0H4Dr3GJ+pZNpwq6XmXjKWGpFDkZ1YYQGnq+uRxNR6/x0VBeN
	 iGqhqWuy4OLBenFcACjqbMU9f9xIl86FMgNKq1qOxO9Kv+hWC9fAxBjSpIq+95bIObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QJ9P3eG42e4bDinmt+GHSW0t1NFwPEsKAAiRCi2d2wo=;
	b=xtCoFsWbl4p8Fnndw9dhA+YuBuiZbdgLGzXOx53ZZLGBTcYXh66R/5qwG1dDpUT8j4by
	 ZPDxyLQgmZwkAnjNOMg8Y94p7ttyTdJdLcgBtUM3bV2PFxc95Wf2RFCgemJfmN2w+xSMf
	 hUveKeD+7xeyJlc+Od+gqXBkClfeWWmH0889XIgn6djd5UJd2oYz/94KOnSUSc+u6yi9h
	 S3MVQHl/J/dmRo3kecqkwmBUskCGSKF8WHDBixLII8d5gwrYLyDgGClCekP6sDdyi7YNI
	 56nfXbVg/ib7hKw+5YZvSQOIk3dsovAJ1S1rep3rWrZB31m8rFHyq3rM7MbOedA/weA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k52RuMtG;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2598606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2598606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k52RuMtG
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so2487768a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409393; x=1796014193; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJ9P3eG42e4bDinmt+GHSW0t1NFwPEsKAAiRCi2d2wo=;
        b=k52RuMtGOXwNVtTmluTuWdrz6HmzziKPCyIga+m7O3whF1QnqUZRGmrAa+0F0B6Pm2
         FVkvvhPumgcU12nLVJJs37zbtLKW9wxEV7VECjCN37qE5q6LzABgdZpFXXiJluqLyIfZ
         c2bTvvHDWdIocpDUGAnlFdCRpnEDvb5k91unxQWpETjtcr9CK7Ar4B5JMEgewbhMO4RW
         zFkbWMFnkokstuzkWg4cmsG2N+x/Q0anqfA76S0WFvTgLSI6c2PmhYKzMukIsHN4Y8fd
         PI3WRkQD57MgOs3AMT0aoyAVNABcjleqOnODzsIgr5L5WlFkJ5JJib+CskmxYiccThdf
         ql7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409393; x=1796014193;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ9P3eG42e4bDinmt+GHSW0t1NFwPEsKAAiRCi2d2wo=;
        b=F0S9gXUeGCfkyeM6Q8+UMUdJkjyC7KhA4XD98oxlp72OIkfloYh2MnMvZUHOUKDSQq
         vy8tgnE0CHoEJ3BU3ROw7VV1GhY3gKa8A0Ez9+YuM1O7Bfocc75VdynTVTKiuLphBftD
         0beAqKI+QKXpqeZFbd1F8mlOhHzaH6UlDKmaPohMyPLP49l9wl6Zr+Tfvyi89/9jkYaf
         A22lPljlIl1OFzngBbdPSGbDl6q4vr2iaYuDJKF3l7OfEkzq5FNhjZ2xDg9VEsObZmdf
         TfnsC+xHpZ6XkdTid4EdDvezdPkJA9SvXbY/xjkpAXznr6gvOd8wXMhODQsTWoUOBU64
         5BMg==
X-Forwarded-Encrypted: i=1; AL+hErEnbuUTMGj3tBoqK3uUCIVfBBsi58BuN6jPgtMAXGktL6XVr6LKGjSo2Ma/7DJ4zraYUKnDVnzpUM6/NLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KvpDap4MH79qdOHCU56CIgJCMvLo90uhbnJTGgcfj84usK7zA
	FlTD6RIFB4bJKJkBBLVdHYx7CGVmB8y0JFmoeAjoeeAJYVbImAthZgJprxQNCHjWgJhMrzajM7M
	u1yvk7x1/IscUcA==
X-Received: from pjbgc18.prod.google.com ([2002:a17:90b:3112:b0:3b4:1ec8:4e4d])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b41c9ba0e4mr8778659a91.64.1795409392721;
 Sun, 22 Nov 2026 20:49:52 -0800 (PST)
Date: Mon, 23 Nov 2026 04:49:32 +0000
In-Reply-To: <20261123044949.3610702-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123044949.3610702-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123044949.3610702-2-skhawaja@google.com>
Subject: [PATCH v8 01/18] liveupdate: Export symbols needed by modules
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Vipin Sharma <vipinsh@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Pranjal Shrivastava <praan@google.com>, David Matlack <dmatlack@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

From: Vipin Sharma <vipinsh@google.com>

Export liveupdate_register_file_handler() and
liveupdate_unregister_file_handler() so live update file handlers can
be registered from modules. iommufd uses them in a subsequent commit,
and it can be built as a module.

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
[skhawaja: reworded the commit message for iommufd]
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 kernel/liveupdate/luo_file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..dac7a1c4590d 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -931,6 +931,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 	up_write(&luo_register_rwlock);
 	return err;
 }
+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
 
 /**
  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
@@ -948,6 +949,7 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 	luo_flb_unregister_all(fh);
 	list_del(&ACCESS_PRIVATE(fh, list));
 }
+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
 
 /**
  * liveupdate_get_token_outgoing - Get the token for a preserved file.
-- 
2.56.1.809.ga0b61035b5-goog

