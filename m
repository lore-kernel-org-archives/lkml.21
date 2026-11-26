Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660604;
	b=bphmaR5Zmecucg1lJAM0ZMMvI83+SRth59fTCCEntO5hGwqUbmguD8AiZY6yzMsN5huT
	 zobeRgZZD6xum0H95VJT1UjjoaDR9sQ8iOgl78BSekXbKINf1DOMBB2lh4GbKkBwYbwDr
	 1vkNQD/tTSJrKrg+AGzpifPHrQ0AD4BlHIyKP39+K6AZSB7C25YsviWLLJrOwZRKvTmfk
	 GiX5f6bzOTX49doxiJKjAWnqTYIpJRXmPuRrtt2NEGWJZs3g9JhCKITtU2Ga5y4RrDTtc
	 +mimEhnlC9BpiY+eHAppw/ZeYavuRThJk5E/oZ0pPZ8NFnk4Dfr62jTk3qKZQVh232g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660604;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=K/aHZfwOuM3vv3+Mu5WDfRhGgSzCzcwBQ2N9xkpTI/8=;
	b=u15TGmv6s1HwI7ogs0N9ED6Ti6YGVY9kv/BX0y2OVpa8E0OuIwvxF4Ie8tYUEyQLZ7Ri
	 iMfxjI9U36waxCFJarWOwo4aqONk0e1gz1nGYLr9jEnyc/WN7lsQMnBHTOOIVs4XjqURQ
	 Gz6hJ3Pv3nN5jD7HkpMn6cp+XyjJcEK95cC0nyGOtm3LEJ8uY2a7tSHuxVfLAjbk8or4V
	 eKWBiuMburyYqS72F7UnQxmb3yXXeIb7LNaz1rHB+TzN3MNJbWyFp8nb88/k9fCkhr+wu
	 aHu7LVR8H+24PEN83QsrPH2h88hv+cLuuzEH3IRbwdy+9w7tNmNmBOAHcChwMIw/n3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE94F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE94F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386b8f2f671so3463380eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660603; x=1796265403;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/aHZfwOuM3vv3+Mu5WDfRhGgSzCzcwBQ2N9xkpTI/8=;
        b=WmxofqS+7pkvQA1Y8yK7MPCcPMouAXstUk87mA9Dvs9LIEFB0uBgapdwHrg9UrCH4F
         p2voPFUdLM82MlZjryxx+kYDx1s+GjwbAh9/w2Ku41W1IeWNGu6zPbb9h/oPTFcRV6V1
         RSnzAmon9+SyE5atzGXfXEI5D+6Ex/RyFeiMrspfqkPiQSZJTY6RPax1g0aExREY7oHG
         oBGAu2haSpgbgir2PCJMq8hNrKyHQknDxNNEWO6wqzjmbnke8qrQ3TaENZiNYn86JFUn
         Sz4/OQJpwOKDtLr65ky603sRBqVpWhnfKM5CGg/LvbpqzOKaCAXAqAvrv1jhr6ufitGB
         aGuw==
X-Forwarded-Encrypted: i=1; AL+hErFHS98jkIK2hJXXohbOxD1/oqoE+R3nLNd+gu+c1q/WVF5auHsokrLOOHRUFZZ7Pvmrz3DYNyaSu0RfLFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CV5BjPNqQvmzi9CnSqCv19JPIJixsieDcN38KL+X5RbHrgEx3
	yP2cEyls+eDqwUWlVglN0k+V6IIsI/0na+8bhyP02n5vL23hmA4FpekBH+O5qYrOJJHVpn9X823
	gi4bxEFho
X-Gm-Gg: AZFdTZcPaHNx4y8X89oOcY9jcwreZb3ACGXRuFXn2EMYRIEjaRruFQHV/5cboMS7hSn
	zKYwnQiXQ8p2NDk+TJXrI1PNXM1vVpxyUaFWBzCb2SRce4+Oi7ZtPGxwtG0WGYlujiZdGTnfKwB
	MQFDXLBZqSZBmdBpyitcuBmPl9wgXjROD7IWQy2fgoG7FB/hGPClPvFJVJA4wl/2iWyA9m3Os6h
	UaGaRDWOQfwNmtCszt4sVtZM42TbAbOhdARELB7c2ItNVyhP+0SU4b3eRb0BXyFPi2vMBVemdWR
	XHRvFpkZL9ZlX/bfABQlWWkFo/DIzjhgBU4tyChDL0lPz9n50KfE4Hc1XbBT585GuqAEmAkhV4H
	IEcR/fPC9OljspCtikKCN1vgijVtH2CF9VZ0ww0O7T3qmjPb6TLGuZLO2fINgajMDlpvWoJZwQw
	KlktVsg6CjqZcZficSoG9v3E4jZ/c/mCKvYh8RpoCF/ZmAc7DmZSb64/doC+pAM7zpZbTX+9mvz
	ATUNzxTw3fV77N5xmpPEsH/pdollnTubGiG1jbhtVg5tCExag2ivH+lkhLGme6VnwqztmvKm5aM
	rzPTPMP9P0e7J5r1GdIP7e2h/h2Q8BmpjqGMzM9jzdJkEgBXPg==
X-Received: by 2002:a05:7301:391c:b0:379:f7aa:1013 with SMTP id 5a478bee46e88-3856fd59fcemr20034878eec.15.1795660602731;
        Wed, 25 Nov 2026 18:36:42 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.36.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:36:41 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
 Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] cxl/edac: Skip event records marked NOT_REPAIRABLE
Date: Thu, 26 Nov 2026 11:35:32 +0900
Message-ID: <20261126023520.39368-r3-ai@linux.com>
In-Reply-To: <av0ENg0EwkGRVY1R@aschofie-mobl2.lan>
References: <20261108022022.3352-1-ai@linux.com>
 <20261108022022.3352-3-ai@linux.com> <av0ENg0EwkGRVY1R@aschofie-mobl2.lan>
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

On Tue, 17 Nov 2026 17:49:42 -0800, Alison Schofield wrote:
> How about writing "so these records cannot satisfy the cached-event requirement
> for an online repair"? Offline repairs skip these lookups, so the current wording
> sounds broader than the check.

Right, the lookups only run when the memory is online. v6 uses your
wording:

  Skip NOT_REPAIRABLE records in both lookups, so these records cannot
  satisfy the cached-event requirement for an online repair. The trace
  events already show dpa_flags='NOT_REPAIRABLE' for them, so user
  space can tell before it asks for a repair.

v6: https://lore.kernel.org/r/20261126023520.39368-1-ai@linux.com

Thanks for the reviews.

Jongwon
