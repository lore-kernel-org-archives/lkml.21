Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827434;
	b=I8TzJ1cg2mf62TH94uOaZ2+etcLLWXOOodN6ZMLmT2yY27am7yBO16ZO/OuKTLtrHO5h
	 ry6/ikdyP6ZlGEWBLTo1ETSr+l8oodYI4UOgghnTl0apA5/UpDIsTy9+2JcB/9Br7YEFa
	 toeWCoTAeZJFDcTXzH3CgP1DbNlZ4yeSSykwxjCaPdGC0wFgN5xHjpY2fTEDBkG6Z/AmA
	 5zn5mrFO5U2cnptBRU2AienSW8mjYv44/TX6MdGOOiMPah2zYkgw/g5dQXwAdfjJYbZS2
	 uO8pIjEEcZ5RLpMhZHnig3fcShxjiNRJgvRiZ/5G7DJ4wSIAQXglAWcoOA72czfm48w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=wlqqG4ragrnBG3kIbCybUs0/KOwqWAzi+ZO0z7g/NRY=;
	b=a1qyEcPwhmseujZ+6tRWYo6S96bvkDKBrY8AT1nkY9wLSMoiI7KNvrT3YVaA7fBvMtWn
	 kVL5bOkep3q97+OadHlyEr2hHnf1w6jSrM4l3Nuf8iILUVEo9f6QXbyVCyUbqWund7jeB
	 WFy3roPnxjgRH5GIgN0phhLWWOGkK3kvMG2+1jQonYcc6xuFV0POP1C/l3RtOTFeJY4wv
	 s7i1gnO6oS7OPZWU1V/eoHptRhJ1ZUjDLQEYcVNpTnGn+eCm+BLdPah6yzv/oD3Bi0wlN
	 8MQQmyuvMQa7HcY/1OaDn3oTTRCJ1UsIhBCUrfu0PVLxm762pbGVvxqUYpm154xM1Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=C1mkJXCI;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C78606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C78606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=C1mkJXCI
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4d07494b0so93315237b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795827433; x=1796432233; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlqqG4ragrnBG3kIbCybUs0/KOwqWAzi+ZO0z7g/NRY=;
        b=C1mkJXCIpLkt8JNKyS0smGUjMBNpX+eUmxEBhz1pCUi+tcqO8q3OQNR2pwPtR+XeLJ
         0JcHc7OYWkCm8K5+Gz2alY2hfBPzSXfMKabvA4BM6/oxeufS/Y8Nvnp52T9Zh1sVbaw+
         yuRMDZQTZP2E1Ur44LJtAMS3wH5xY9PSrQIUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827433; x=1796432233;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlqqG4ragrnBG3kIbCybUs0/KOwqWAzi+ZO0z7g/NRY=;
        b=CiiM9AhErK6GPeL80TN+BitrXJy++8Npu7ADs954S8SEP0z2S9aWKNDLyTJSfoAXfk
         BDGHVY0wWf5yhr+VxHO0drCSvc7WwMaSAAODBciiDMR+u/iCC/Xj6ubOR2HWEvljcCoj
         KcrOFxPET31zXq7zwEL7LTfYNvSRFCA7B+SXydUG0Lp4S1Ac3s/WaTodHQr3LMgts61n
         M1TO+qRbxH8uecoh0ikxCl9EXuav93KXzbSZZPkB+cHxuH6MNlm7/ir47bDqVjcVxdO4
         BI7OepoAWBSYJyNIjK01bBKmiIzFrprq2/7B2zcw5NoBOv3eLy60F3/d8uMVAZaGxuUB
         pu3A==
X-Forwarded-Encrypted: i=1; AL+hErHOSyQSXY+/zWS6Qsv8gluPtsmu3a57+L1tAwllGYf4e2OCtxIWkoPUhAhG3W+ScQlFoMHK19yZJcEZPq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DDkQvGIjVXc3dgN6UEA9A9VfpILK1GcJ1VOi+s2dknM71x8oc
	UI1oCK1dSi6DO0+bMQ/IbNr1K9IaqYh2h029BJJXEMjPjlNew8LfIYjMUdTc3ajNQz4=
X-Gm-Gg: AZFdTZdKyzAU8jykRS/cM7dxudwgYLdblFM7lo1Wbtxhm+R7AcFsByfJvGFdgDqXBqt
	Hr0KGquV1ocC/7pXXA7p+kGfTwBvR9QdOoE2NA82vt3Tdm1VEBAyto652L/bJivHbVB4AnhAXPM
	GQnCqB4B3S7wnxmO/ZI9dP2mN+o74jjB6msjF54T8ebn3IgD5uKfv5COcy+48fstsRc2+GI7CZj
	yHrQTaIYlYydAXNH7yJzU/MgCV9WWxtWubvRwqB4aOZpAjzjOQLSjlv1pI3w/V+MFROVTp+GARG
	raUJlpB+IjJzDPWdayMWyBUnntT6TW75QYsvfkgkPzfwO3PMOYPqpPp31+lzHh9JkzVrVs/cpXE
	vZIfxwqJLAq4GVsarYsvtCPysCuaB/NqSL0xDNNuP42X8tRPrjIO06ekr2F3CLFHF4RISkUdaGf
	Xi2IyiajhcTybBnfwu9bbi1zPdklua9xD2ry1R/TY+Q4hti17doCVlgV2nuNTh3Y6r43z3tNnG4
	y68s1dfHDmMfXCoz3C64Qeaa+MvfgIpa4nz6QbLJA1BoDmIlZxHpOggjlo7TeE79DAm5n5X5DW7
	k2i7b1iVcg9nZ45/XS9YoUTnUj7gNSJ3WWTecj+m76NaKReVaJ/1EH2PL5k/JsXwpxhcGMJxOR/
	uBjgFFRnhPgFNqLzYngf5pTfPJ5ntEGuXtY5FS5Pi9PakDn1RaK8ZGx91osgjCywEtRklx2jjFl
	liJ92ju+7EZs8OFvxbTGHO1WYp508TwTT0iiCEKfzDMHR+uTUYRjIkiBes0GJj9KUtZ79InjvRC
	rWWMP3gKz7yam9R/iOBIX0=
X-Received: by 2002:a05:690c:c1b:b0:87e:645c:182b with SMTP id 00721157ae682-8b5204dda89mr106486127b3.26.1795827432517;
        Fri, 27 Nov 2026 16:57:12 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d628sm99080227b3.8.2026.11.27.16.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:57:11 -0800 (PST)
Date: Fri, 27 Nov 2026 16:57:10 -0800
From: Chris Down <chris@chrisdown.name>
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Greg Thelen <gthelen@google.com>,
	Greg KH <greg@kroah.com>, Ming Lei <tom.leiming@gmail.com>,
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mm/vmscan: Fix legacy memcg reclaim deadlock
	against filesystem freeze
In-Reply-To: <17d0d1395c0237d201a1abb2473d51f5@kernel.org>
References: <17d0d1395c0237d201a1abb2473d51f5@kernel.org>
Message-ID: <awom5tLa6tNWPZYK@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Tejun,

Thanks, I've reproduced the deadlock against fsfreeze and have verified
that this patch fixes it.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
