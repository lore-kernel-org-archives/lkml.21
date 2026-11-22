Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347541;
	b=eSJT/y+HjV14ebl26Fo9RZowlSOqusIsic2UmDMVgIsa6u1TC2PJP8UHPyBMAiO2d+WY
	 Uzoga5pryvrJ0lo426Uo/Ik0kiQU0gjNb2zBPH6zbe4fDuDo5j/CG78FppbAGuv90to8J
	 ChZ1/AFWBwOJFdnHGpHqKtTlQVXRpbyqDPLcg6dVxRQTXH5Y2yMOAfXJuB8jV3bSeZopv
	 FjgXA3uNMaiRe8tgsvpEorBV1EK20Tgm5kihO8iFaWOXzGaT/T0BomvI8C7jEU27GF1kH
	 kXHIaDEEHaR5cz1/S/UPS2jOFUMNMb+mXSYZyjGzpN/OlqLsxmcfrgk0l4lp5Bb1wDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9SL2nw3BljIJfL2BNxy4TtTwunpxe4OhPHoB+8Eji+8=;
	b=io+g8yp8pH0E6uTWK9wG9MYj5+OK8X0oa2Jb8Q5byOc2yZ3Im0st0be4iZIYDtOZE4wq
	 yv8JPjNGUeySCkglo2TQMb3F4nn4VfDtq2+YnBm2T5BsVDIo5gLHKco71sTltfYGKR8rA
	 3Ein06zj4dpNW3ryvjmhJISkAtT8T90rgocT5IuBoa3YSVuyvFrKheyHTqVQQqoDTQRa4
	 ikzLCud0a694LhHlHubV+fqjiTb+/lMA8zvkjAzcs8sFKfDV720PlFL9rbkq1Qi8rGGMf
	 P+8RAFuS2Q7vsBxoGeEQyaQL9JlA9/HT48cpq3YIFbHG5RJHloLHWzXC6h/Ab4BzBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWH39Jbp;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5008606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5008606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWH39Jbp
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4262807c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347540; x=1795952340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SL2nw3BljIJfL2BNxy4TtTwunpxe4OhPHoB+8Eji+8=;
        b=xWH39JbpK+tCheqveo2u87AQgq0TnNUTvJnMZWpxRBFIlKxzsEJJc0OCsjeXDFd/Rt
         8r2t45ifgCg8vHXxBmEn6LGP+C7AcPS13+4mRxdWPaBivAKml0DlftZOdDlin+l9bTCi
         +SDVrJ5UL6FBmF0XE+CLbRFyWoYG7wFwdoIiNaxldrUJl5F0VzDOkTW8aInFIK0tjurH
         dy77usrjTK1GFy1mCLsmeN2cOt2dLUoIQfbDibM6pAZ0jM/GyNTMRl9YBtHUBR0bqiSl
         RnYS3kHMqPY4+j/rYH/gtt6AFODiGfwRIzD/ZBd/dX2PrbrHI0PO+IC/073wauJTK+zh
         QLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347540; x=1795952340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SL2nw3BljIJfL2BNxy4TtTwunpxe4OhPHoB+8Eji+8=;
        b=087wwVMVrxEsOBIv5GEL6nb4kLy51jMZV4Q3Eq4y+nb5TwCJrbu0VxxsQbh09wmcHe
         jCZ2CtE0zoFOJd2HF59oZKvTg+sLpbyFlZcIjlFBMR8mmJF+91RgqYZuSPXAN/uCEqfu
         KDOqyh/shQy8Vhq6zS4q7jKKG/FqSQqjZn5T8c6jTmeB9MxlIDQG/qEvTXuIunQOBs2H
         ZYFP29L6d/zJtLSJrVzn/ckCQKMmnLEtJfCDs1dKHmYRIVmeJ8s8JbnMgBmoFhsdkezy
         +umZGxuHncs+LiXJpvmlL+PzyK71b5YLMEfyCTcNm31XsUFsL/j48g1xQw9+8QagllZ4
         qbpw==
X-Forwarded-Encrypted: i=1; AL+hErGMDimhY8+usS3h/EPa4LpT1cSmUKm33cAeD+ZbFPU2YZKtdCVzDz6/5OS1AeFLjSjfyqX1QPtsfdC+YbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ntBTZ930BDUb8pOcJxn2aeLldqlEu1vw7sgZ5IaLRoHSovHJN
	lIZqxoeQgPa/rHDlDuxsyMiUvwVo++gIgxvQ7vUcqERbV6+RJwIkZbaw
X-Gm-Gg: AZFdTZfRRoO8ZLmcGIQkH7jFuHPF8//LnOGyRtkGhLm9v9d+3rqYMTEm++Mr/PC4ds4
	73JAwk4zaGhbBUORcZwhEO2hZJgc6VBntJm1W+oYBdqOuMMFGDL7hGRhXs3SBsaCLNaQajLsZO2
	VD2wQcoekTiN8rnJqSLOR0csLzVTthOfo2W6u2x7FZUB+1tG8kfdFrDOr4uWvQhqxyGCv+tgUI/
	XlVak1mucz60+Dn0b8FodQ45xB2Rc/MyMtKnoVGE7enpmy4RsIbtxNL4uuvFflO/7LOnTmawYoR
	8Ok3RAL+Gyd+xHvI6yne+Kwl6gE6bONyBDOzhsO4hIsJmFz6FRyPRnDmErnaXlGRwubRTGgr4MV
	TFxGCunHbLNpxrg7zrllj6373O+x+sxNRrqPwUGxky659+wez9cyLAJZ1bb2EwvbKzPjPv2sALl
	YGki1U39ExUtjnP2INXkpcu2Wwq6uU+xc2ImYAEmgdTHC6A0hwW8FfU1ewUtefbtNGg6lOm9NUU
	XfgfXa/iJN8q2c69RALDjS+16HYDPP3SAhABREpV9hyjhXlqQqAy1WGeHVqikcDm/ltGRxERTlh
	I2mqusRIMm4cnAdHWCHiq18Ef257OVs2lMeV8KIYyOHN68iAUq9N8mKaXoajVvnhLryI
X-Received: by 2002:a05:7022:f509:b0:1b3:ad88:b9c5 with SMTP id a92af1059eb24-1b5568b7e07mr8368775c88.24.1795347539687;
        Sun, 22 Nov 2026 03:38:59 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm3717851eec.18.2026.11.22.03.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 03:38:59 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: wang =?utf-8?q?lian=EF=BC=88ByteDance=EF=BC=89?= <lianux.mm@gmail.com>,
	linux-mm@kvack.org,
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
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG) and flag cleanup
Date: Sun, 22 Nov 2026 19:38:17 +0800
Message-ID: <20261122113833.62817-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
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

From: wang lian（ByteDance） <lianux.mm@gmail.com>

Hi Kairui,

On Thu, 19 Nov 2026 05:03:32 +0800 Kairui Song <kasong@tencent.com> wrote:
> - Rebased onto current mm-new.

The v5 build checks on x86_64 passed without issues.
I'll continue to report results from additional tests and workloads.

So feel free to add:

Tested-by: wang lian（ByteDance） <lianux.mm@gmail.com>

Thanks,
Lian
