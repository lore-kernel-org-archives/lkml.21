Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351455;
	b=IZ8SumAPY5anf1Jk0WsWfcM31HUSaBkAGCYhj/UfpV0+Eg5/k53ruKpiS2Iap36wOI0O
	 PzDKFPtUC66MWhKmvfxEKJOC1WT8UYHRBXMQBXXBivWvLv/T5xrXvb4LoWX0XqXaG8l8A
	 KVnxW85/9S4CeBjYbinZZsiVu+83llL1mJ6ph17K5O++fElNckEfBf+GZJoRAluJqXlPe
	 Mu3VpkmXuQPlHA2GiVwsgQ5EWkFMQTzJDdiCsDKnsHFT9ohOJ0glwiPIEHBBuGdfyvPbP
	 gRBOg9wDDGyFCwJRnNY1EsZeQD8TjMwRBgrpI/TRVLJlmJ2AgtmZJa/gJ1UonlyYMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=14LnegLlUwns0/xDAhlDRDvD4G/8p4sFhn7pqvFB7DM=;
	b=spLL74+91XHzpZsHWzpwdQVAGTLNiOlDF+UA1Nnq/P00Q8z1Ph9/BMwba24BuRpt4YOx
	 SgnKzPyziBQGHejb99nu+nGROQF90bDT9tV2+H+eY9iAg+vEd0MrX44QuuAisqRAcdizA
	 oJN001208GkiMVzjzDXl56feFw6vr/6HzJx+CvU3X8FUdsL2tJ7SXWR4AJ7NZ6O8lhGnd
	 1wcGE1kQX84mkex3IEClv/JUmecUjr780mS2BbN3qjxtamlak/eLNKehLq1bW1DaCgduf
	 AcnaH/ANiu8X5fkwHlDVgfiRaGeoNKOZHSLpfQfhIqpX031x/K1y2kFfyvirriwEOww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAIZKY29;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC198606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC198606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAIZKY29
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5327761eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795351454; x=1795956254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14LnegLlUwns0/xDAhlDRDvD4G/8p4sFhn7pqvFB7DM=;
        b=FAIZKY292g4PLAs4iho8SWMuRLmqE93tsKmh7In+GQxH3iPQA8UPqNy6H44ekr1QjW
         JdXkCtltk8ErXk+K3Uw5mPsLyHA9B7h6Xnpc95BBC1yxrZ/2D1IWEjNB12RQtBnm3lzV
         N71BRe6DNpDLOEy0ekAvSvEdLPYTVZtYWlVTxXYTOY81a+c3lTjTZSdWztZ9sdV1VNgb
         0cFfgz2OEGp5yJOtKdeAnKge9RG7S4eZG3cnVG7c7oqAV4o9wfPO7s3ZrJ8ZXcJBG/2f
         krk6ftoxRawuc8M6IEPolfH6SVVj0WQAGltJApmtotnuruQcAyVQ6k1ZMsB2WlCJ0uj7
         AurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795351454; x=1795956254;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14LnegLlUwns0/xDAhlDRDvD4G/8p4sFhn7pqvFB7DM=;
        b=wKrZJqocIfcWdkrzuHbPC4ETNWbFVee7jw7EkDq1mouvViuyIVDvLqX5lZwllYwI9d
         wo6lcb6fOvJCjAjR5ZJhJNr2NJjjrkt9Fb7ggofArAc8McZWMLJhUX1H9A+lWnNvhAbt
         owDi5UpD8m8+tfnZ0PtaJYD7CJsAAa5xIecu9vyqEPV0QNQEW+42l8Q56XIRfMK/E2Ji
         S/wKCsq8fll5/z4KOtTMKneGoAdlLoHpSUlEiJE5Rkthg3u+AcCFk0RwlcOzG/m3ozy5
         qIcblMVfvGbI7edIWZDi3OH+FuMRUwhxjg8Vq3Ku3iK8Y8hxV1El6rYXulAqR6h6axzC
         roQw==
X-Forwarded-Encrypted: i=1; AL+hErHQpx9nU5VgYRNKOnuovzqZTWSgoM2eFcsEzW/EAOvbbKCN7zjzd6K8HSqYCebvJRpnUgGQBGpvc6pvfwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wC3v3XwPNrACLBtjEo/85UUbPaIwbVsmRBSlLOQHLPgHrf0BY
	rJOePTFSSae//rrTBwecOCPHFsciZJYRtM4XQrg5bM4JX1CbvUIognsf
X-Gm-Gg: AZFdTZc8yZas3WuRLXNVBPMsCZTpeXrG7pGF31jxspA7m0wGxbuad2AsHowGDpSkiPJ
	9p2vbrEp9M/J0sMIX6WJeGx0XAUMZDcugF0yQJalMPLsjKjG8GzDDWuBVvR2Nfopfjqy6ITX2Of
	cYPUS3lv6ejfEeRtdoMafZQeruxBMAs4FYqY2kUlmtNGXgr95zKZbgHEp7FUXuelTkUYi61/ELT
	6g4wdUGmmCHby79kkfewMs4yGa+COl65v6GZ2kwIGMhbcmlbBknturBAQGbrRq28tvFxQ0i8K53
	rEPdHt0MDqSBM8u2zKFC8IcaopOnBaFc8IO7nMT6xiPCOuCSmCzQbyGXljUi314uBosyIJX4Jz3
	h+W4Bjo6y0+2NwCetHKJG1FOMyYnzxN6T/3cVbKKpNI5J83D6vgfUpslxrDIwTzxJw35EjCftMU
	FfcU/SOsEe/QvmvlWrfo7eFqQF5am2CIR7hH1v2R298j/YxkeE5Ia0ag9LXGqsKYWLpUcYefHF2
	YytGVGv1gdITABBEgeG72foOh7M5wfuPGKhZ+dVGahvlZO620PAOK4k07eNOb4jXuhNqAZuoiGY
	eTlckgXcrt7ZqRq+Ocpxbzyv4LcCbV1GWxeiSfOGVDd8o06S0x0aJ+a9wy7DPCLy1Gzt
X-Received: by 2002:a05:693c:880b:20b0:386:b025:1e1e with SMTP id 5a478bee46e88-386b02522d2mr110063eec.16.1795351453747;
        Sun, 22 Nov 2026 04:44:13 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm33447310eec.5.2026.11.22.04.43.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:44:13 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 02/17] mm/memcontrol: allow update of LRU statistic without holding LRU lock
Date: Sun, 22 Nov 2026 20:43:36 +0800
Message-ID: <20261122124345.66978-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
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
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 05:03:34 +0800 Kairui Song <kasong@tencent.com> wrote:
> From: Kairui Song <kasong@tencent.com>
>
> To enable moving file pages in folio_mark_accessed directly and lazily
> for MGLRU, allow updating the LRU statistic atomically without holding a
> lock. It may cause temporary counter underflow, which should be fine as
> the counter is eventually consistent and only serves as an estimate.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

> ---
>  include/linux/mm_inline.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
