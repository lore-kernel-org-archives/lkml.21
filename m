Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169360;
	b=ORrWJ8RTXQCLvnl5dkRKhoPN4OFq2ip2o/jKioYtzk4YRupHXL9EfNNmsS6EOfFsXXt9
	 5uKvnJe+YPScecDfVkQkTSEAt/VEOzSmU7dkO5Vtb1jCrRwJ4GEVVtsNwTACmST7Qccs6
	 icHv5jptDEtFJQcrmRP5I3Ydl5e399VxwbD3jzs3YKIFWXR43J72R7XYTW/cyTRcHD4Wx
	 6bZ+arNXLr0g3gXj6TfIv0h0rpRT/TkzLjcxzgO9taoyswRxm9otKE3TUT6qC6bZ80cpw
	 z4y+DsKPgtvog6Hp4m010M9NwWzqCwAOUojLDvA/5HWCg3tCLh7085ntp0Br73qYgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TLxSkfYLhAc7bq+V5pE9s9/jugosIWK4kuSFM2AGReM=;
	b=J6tBzziur2nkuiHBl/8vumlJF5ygg4ZmRslb6xR+I6S8b4o5ZsqWB2dVSFVB87ni1aIx
	 8gR/gntM++vDZWflk7h0W9Iy/Bq8G3RopOOdIuQiHBwsD+I2/M6xaSh0cnlzsqhyXevx5
	 6vUH0QlyvUm+B5Q/ojKxkybCQpzd7YWNWCYtqUQU3WBLy7S+WpdTdIyfbgRTk2J9JBYC9
	 WhcsxpRCKi7GrWemskltqDqzX0O0u+EAaSEQqxPREDM6J5ukyDSi7VoJqaexJ4Aihs3g2
	 6mEYFH1NXN19aFWzhHrDzmL8MvupD0ZPYWg2k0Ryhzgqu/pKsDEP//h7TmYaMCKd2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cmjl8K0i;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B460A260A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051B460A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cmjl8K0i
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so701693a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169359; x=1795774159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLxSkfYLhAc7bq+V5pE9s9/jugosIWK4kuSFM2AGReM=;
        b=cmjl8K0iEbrd8n36d5k3xh+v3CDVwiKSm+UgZszOp+0vYDmh2aiCH9pX6f2hhlamYR
         /SASuBGQRYmwcvYlCZLn4esfxenTlcBPZmz/ufD+8u2P/x8td/geXNfZupV0XylWN+aZ
         qYEc+LdG/aeldoWXQ6x7M6qNm3lgUtgH6zpk26laK4hYXkfkBgvem9zi0xlWj+L4PteN
         2ZDbApdqLLM/+BkQHjLDT4+HDfHyvNRtVp7xiWHfVtSiifXuX6ggLx9oD67MV/VvsyjK
         Y85xS9XsSMuAQaPthQ5swK9Ix2RaUEsVJiEkMiBLDA/Noy1hr1Dg0vEAYo0kJ7uDp+SQ
         C7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169359; x=1795774159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLxSkfYLhAc7bq+V5pE9s9/jugosIWK4kuSFM2AGReM=;
        b=a30b6r1yIkc6Sy1o34WjKnGshWyK/S9yDRfbdt34ORWBSopnYxSY4UCJcOYQS+NbaW
         6iZqGAI8SKRs1+nEolkoJnil4jpd1OjNhYDmUcECFgG5TeKDWGU38sdMLgA3pT80brAg
         uzn0lBoX+Dk+2Rf8RZShVoheh6MkgUERY55KAgOkjsx61MievfsqH5wjy/PwyDqe3BHN
         9Dflvc+xH3m+8kbSuWIIaiDwkCaCHUhgCgwSYqi2gQv9uFwgjzRIaWg7ihhZ4wO01BZn
         2fMe0zIf1OTnG24AU1aTzdfAPmLURJkf9aflku5lhBHW2MkMAlZ7B9CTH7fCMbMqY0eW
         VLQg==
X-Forwarded-Encrypted: i=1; AL+hErHPTuBRYgTTKdLJDxyQSwsu6SKM3GW631Y8PzxGhr2n7RHkrCZFlwuPuWLzkdTAjIOy7I40PWQAAKmHO7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gGCP8FZai6BCuo9GGKyA9bDGSfwPQd/lQKj/752OY/H9AujXk
	yeZJkMd8s4ENgXEevBmWwN2BcscYd82jt7x/w31BheX78BE6+LhvM31gsvt1HmYK/78=
X-Gm-Gg: AZFdTZfmO2W7WIhVJZXCqwMh66nQc0JoB0EBi762dN01Ecq05ojiGPZgXYjVuIWsxH4
	c/DGi+j9Byh7uV/vNgQL02GFtDdU1kumyZTOkTM/E0sCgHlFkBwXGfEIoPMkiSPWHlI+ojQkWI4
	Ek0Les5fQp5N9coevodHyJq43af+/+CM6uSSr27uShBz9Lit5HXbQE8nkaYGFi4jY1wxpXzpL2n
	X3+Hp5vp2sDthfns6u3glaS9C/BCQLimwGpASpUGnPQ/SLbDotnCTWbjNiYz1vY7G8jWWv39bZG
	5rBTOnx4yRNYJ9RDoujf/9Pl83k+BCODdKiWgwXp4mGyYAdlasp22Z2v7PJL/w3J4AYxtz6bF+w
	j0bdt8vWtx4yPXfkAKSmQUqYm9jm9NRoJHc3BSAnxFtt5bQuynsA3jmyIcCc5MpPjdW5K2kPz1X
	iNKbvxO8CcpU0qmXBMqSIvYA/tuEfnyN0l03jbgW5INDWCzyT+5oURxXQHC73n+MXwjTpc11gxg
	PQeXUuMuS/wEkbtsfAayB+fmk+tewb5vA27H9T7SAJnvR1BaE4CijmHcumqHm1cGDNPD3v9r+20
	4+Z28638hTGyv2nP9y6hfK5yQNMF6Dn4JIHP+CMDBOm1Dv+0VijEnb0YE7VQU3o5k+IlRQ==
X-Received: by 2002:a17:90b:278c:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b41c97ac48mr2625681a91.54.1795169359317;
        Fri, 20 Nov 2026 02:09:19 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:18 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 01/11] mm/mm_init: verify zones for template-initialized pages
Date: Fri, 20 Nov 2026 18:08:46 +0800
Message-ID: <20261120100856.16929-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120100856.16929-1-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
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

Template-based ZONE_DEVICE initialization bypasses
__init_single_page(), which means copied struct pages do not run the
vmemmap zone consistency check.

Verify each destination after copying the template so the fast path gets
the same validation as regular page initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
---
v3:
- Retarget zone verification to
  zone_device_page_init_from_template() after integrating the helper
  series (suggested by Mike Rapoport)
- Collect Reviewed-by from Lance Yang

v2:
- Apply the zone verification in memmap_init_page_from_template().
- Collect Reviewed-by from Mike Rapoport.
---
 mm/mm_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index a9d848c92678..0129152b74d8 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1082,6 +1082,7 @@ static void zone_device_page_init_from_template(struct page *page,
 		set_page_address(template, __va(pfn << PAGE_SHIFT));
 #endif
 	memcpy_nontemporal(page, template, sizeof(*page));
+	vmemmap_optimization_verify_zone(page);
 }
 
 /*
-- 
2.54.0

