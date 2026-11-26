Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660596;
	b=kjP/q+2pZfTPCKidn4sB4CaRwyDoQvsICshSmPJd38eZTAqAPW3AYt2HsK5MWsNfJ9Qo
	 q6+0dIdL4KotpCwJHHRgA1DbtebMxzkIH/OMYsG/7BpUd30ZllZLeM9cLgj+frX1XQYVt
	 iUJl5p0aljeTKOqWN9NB7jZ/w3PanTuziA1W2qU0z4LpzQHkSLgKR2Eg6G15ck+sxUHu9
	 /oPcDi5AGUSCkZTd6XjMQe/N8xu1NUnIE8Vh2j0KB3Jq3gqkfDEtp2oBNBJrNY3ufHTPG
	 UuxXA0XiRloCha0NuuVxInRk1t5kpLr7VG/EYCH2Iq3dza4WtyqJ4peXbP42NCmuesw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660596;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=z10TiqzuITDCTYtzs59wQFiEMTJflteO0aiswGXuo5M=;
	b=cMcVXHZBwvqlgwFeuanX9zP151rDoskBZ60S6giy+3ncXOrMx/urRw5yqA8tcNBs8fga
	 J5a8DpAIHC+jTsYSDDC2JWpF1lTgaHoQCHtncGqcxqG7/lALTLP9pNVQ4SROUZRSju7t1
	 kziLmCuHRTDOgTFuJAJDHAryQ5IO85VOpTx/KTvntK9PJbMVuK0uuuv08JYgOopvKKzXN
	 4tyRGLNomhGznoZRoZo5+++I61zJB+7JzBQZ+3o9Qbfw7DIeb0fwWUIGE37OF0owz3Z6o
	 J3tLMnuweXhgvWywkPk7EKSf5q3q2MFn202ezDcmPgw0XtP6mvGydH43kIJmAyawBKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A19D606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A19D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso5689236eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660595; x=1796265395;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z10TiqzuITDCTYtzs59wQFiEMTJflteO0aiswGXuo5M=;
        b=CiuUKeova8i3K6QXb+pIozAuhQ04b9T/m7QjEpBIX3+bxre4YWkmKixyGQI+1CRVKj
         IfOdlyAZmEaiZI3VmnNWXegOubeC/tiUAnhWKo5vCFD8zKzomDJ8lJMLXUskw288DHYK
         t97/uxJ/Apjzu/m8baiU/FIR4JqcTGb5jx5Nv7M0uEsnEkaiXA6OZKr3V6sNYdWLsWjM
         NmXMYhKlbk+cyt2UKKvLH/C0W9zyhyfw04Dtim2LY5UKPOGXkn/kdGcHY34i8npE84sN
         QYpw+wY26gg8hqth6rRmXN3eObctwJudCyCw1ABvZpT/dsuBDqY/a3TCavD4AnztVR6l
         zlSg==
X-Forwarded-Encrypted: i=1; AL+hErEFygEQyKctZGrohD/Sq0v3PlKT6fgTVkyo+vdIihB/LYIWdWCm2A6roPqAKZWGM6qzEgEi1hi4C0pqr/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TKkZBquqnq+lKglY+enOpjuioGfF72hRV8+HjhH0aaWRoEghH
	y/96LdNvUnTt2X+bcYAOiVLG8MWFxGfLTMv+TFOv5yZM9+Te2lkkrqg+iZXHAHCKXHQ6
X-Gm-Gg: AZFdTZebijlqkKHuo9pokj9jZFoN0Z7imbvkwJjEPBDLXkOT5q/LP7DVbUcim0v5jr8
	cq6vBR6mtp6+hJQZIAxrGRKwV9NQ4M9L9J+g3gjl4WIdmjrl082QXPiilifAc2AHwjUTRu2aCJu
	YJiQrqE7WUaOMvzczY3h6lhJ95DHRDjTNpzfqJtp3k5f71zx2PAwyJEHVE4MFa6PX8HoSaV7wpQ
	zCbexOGbSqI4whwp4elpDZp06qogHunuFvDljVzsotQiJgnJCQtWVzz9sIjkrZCrvjlb7t9hyoP
	2FJ+zFFjJlbz62B2H0uyrwPtL8zS5wH4hT4GmEELT6GlS/QKPyqDvo7j5W/27SaQWNhKXLy5RmS
	STPxdIVCuxQFRHGod3gspQufPAk69WYtUVgsz5tlhJiTdXJ8NroFV3qxQGl7r2Im5aKkRqgMLoL
	yLicv13gHyaYsI/Q5F5Krv2PCtGkwDfzWdgUYr8v76+I5fVeIdz4zrwSvp6N++ay5vPHVIexDv5
	VRa+T7/lj5+cBPY4DgTZVbpF2Li2sVzUeQyDiQmc4m5FyF0NnhtyMlkgvWHsXCzDI4KI3iONe+8
	1ZlcH86cHgAeHQYnt9fLYyWuMkMshW03+refZxyujpuYmTF7VA==
X-Received: by 2002:a05:693c:811c:b0:386:ddd5:14e2 with SMTP id 5a478bee46e88-386ddd52196mr840587eec.0.1795660594957;
        Wed, 25 Nov 2026 18:36:34 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.36.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:36:34 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] cxl/edac: Read cached DRAM event records under the
 xarray lock
Date: Thu, 26 Nov 2026 11:35:31 +0900
Message-ID: <20261126023520.39368-r2-ai@linux.com>
In-Reply-To: <20261117013521.5b4d034a@jic23-hlaptop>
References: <20261108022022.3352-1-ai@linux.com>
 <20261108022022.3352-2-ai@linux.com> <20261117013521.5b4d034a@jic23-hlaptop>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 17 Nov 2026 01:35:21 +0000, Jonathan Cameron wrote:
> As I just sent to next patch. It would be nice to have a guard()
> for these. Maybe it is worth including as part of this.

Thanks for the review. I answered on 2/3: since this patch has Fixes
tags and is likely to be backported, I'd rather add the guard in a
follow-up than make the fix depend on an xarray.h change. v6 keeps the
explicit xa_lock() and xa_unlock().

v6: https://lore.kernel.org/r/20261126023520.39368-1-ai@linux.com

Jongwon
