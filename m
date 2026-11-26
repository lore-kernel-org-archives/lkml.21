Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660589;
	b=5hYu1LqwjLixTLum+J6l8oCz464LU/hB7KrainRXwAHKhjIh0YWweHIaeHA2nt/GF4J7
	 iGVDx6gbKFfgoUZ9ACOBLtEhD9sUmP7OrooaDDbu+rFfFHAJEw29ppqF6Bol8fybGyLqn
	 mjgxrMPUMqGlNkdHHPxUT0+kwr55VltqHCIOeE0JPlk6s9J2BKFCQrCAbXAfsthTltI1b
	 e9riP0aTLyw7KszxrlJvd4aVdbqPBQZ1LbuzLK3zr1Uwopbarxt8kL6WO2txSQ/ybYV9K
	 waogBu6fEcD3D/+7rekN5aHU5JeNFrMmkARMudKUrPnTyTk8psJYF70pUItAWZVbooQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660589;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=d1im+uobgRkSqSI9/LbjTpbL6FEufZ/cGsj7+yO7PyY=;
	b=olYGC4hoLp7a8pXD0IasMOXs0xWm3V78OYws3WV0iCpF8uLQj3o5KJwtjBOfopUOnPn3
	 MzmpMxxVGDUw+FeyZm0UM0qTQhl0MNww9d3c9f8WW+bMooWvsKw4t/NERg37JH8ZlvFPv
	 WDNRoIEZvcSeSJh13Pw1NXrcRMAzAW0c3ZE47l/fLUfXtDLaPQ4og5Bd7x+bj+xYQT8Z1
	 DJS89jWkgPbPyUun7C2Z3DHiDo3C71zo/jTMJA/oTgMDiCyp1ZDUai0dBWotXhl9WsaeA
	 Zxsjetg6PBBKmQfLn617j3EEuxEOSQfC6sjMcCkfBVIr+7K2eDVse2sWiOIaZkRJA3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D1606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so1493378eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660588; x=1796265388;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1im+uobgRkSqSI9/LbjTpbL6FEufZ/cGsj7+yO7PyY=;
        b=L822Qq3g1NCWlJQ+oFcuSlvuLpET7i/WFW3nipsJl+ipZGIAaWr+JMGfWhFa+13M/j
         z651ybs7Po5iH2RfOs2gWkNf5aFD5kgCKoaUPdu34zA5wcWZ6lyFztOufIiHkGNDA6Hf
         CEH68LAni+HzUO0gLrnyinjj4Z+TNUWgBrKbm/4vw0XLPv0jIiZhkX3amZafwZsMiiGt
         e+0H8j1ezosbXNtrAltFm1CUntlxhT/tAdxfdzAllkwkBIc4k6Mx7ljuGB/VhwNAoYTZ
         CLPibWc5SNY4fNX2IuezqpqJ0HhBavrOgwLjmdtMkZc5c/2dNcCNcQJGr0i6PdR8IzNj
         EOZg==
X-Forwarded-Encrypted: i=1; AL+hErE4TdsGKdyQJPZJ/u2Nh/xXxpo/2PY+FApR6WgGEj5GxbjBRCw+LAGw1uLzwoSZyMYpZNZ5QHdXsqrIEFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b7+RGdnIlfj1/kflryglYufNS4yz8T9SewNVEBaZw2XXuIvNE
	cQ/l/9aHXpqQLqOyH8Gu1chrPsXeEcJ/WTNfXPX080pLMzmDxAuoAv3vxsoYkvxhkvg502ceI+p
	AE+kqbiX2
X-Gm-Gg: AZFdTZcb68j0yhEzC1Y/19xD7/MSKWhTf9XO5ZIpaJGH+UFwV8g64chvidFvtMPmB76
	JgbINLK5VKJrjIC4eQRmJVxkm+xnOk1RnvAyvCDp1iZfLIyDrhXKgPU5qZCiRJFVXnLCCmN1fW9
	3/y6pX2AwNty0PbAmDA7MdFbX5a1vCluZw6Kq8appVKeG3wxJ98lrD7EGKq2+Whlda2fVo+Pmk3
	ejgNqPsDeofftG+MqvA/geWYZ9Br22gKBYZ/8abs8ZmHGpaascQNo0v6bbkRsl91oYuJuHfltue
	cxIqRM5b38OrPnh5XwuRt63dv21UD635YS41hyPXQReinJsPrgHWlqSdNsINAlOz2lSJRquT7kg
	pkgiATaZQDkSovUn+cA8ThBNIpGy6GiG6FD4pCuTHKKYaNaEod7dIxyCZfCM/byNbIm4pETgXo9
	vbYbooAoG8ryS+Q3guAoRjSTr6RC2cdR13/keiFWZitfKSXGbsZgWkcHFAsaTu3EY1GHh1geJMF
	lM05/OfxOTsDpDXQgy1mRMesyH+/tXPWnJnV13ioZmglVJfaVYky4tLozxCdSC9kfa9mlxjn9Eq
	h2qi11de0izxc4j3J+U/ZOoFRNTHmQM31tuus1TvhaM/gUiykw==
X-Received: by 2002:a05:7301:df48:b0:386:a5d0:15d9 with SMTP id 5a478bee46e88-386a5d018c8mr13659833eec.37.1795660588397;
        Wed, 25 Nov 2026 18:36:28 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.36.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:36:28 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>
Subject: Re: [PATCH v5 2/3] cxl/edac: Skip event records marked NOT_REPAIRABLE
Date: Thu, 26 Nov 2026 11:35:30 +0900
Message-ID: <20261126023520.39368-r1-ai@linux.com>
In-Reply-To: <20261117013017.3e16c98a@jic23-hlaptop>
References: <20261108022022.3352-1-ai@linux.com>
 <20261108022022.3352-3-ai@linux.com> <20261117013017.3e16c98a@jic23-hlaptop>
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

On Tue, 17 Nov 2026 01:30:17 +0000, Jonathan Cameron wrote:
> It's silly but broken?  I'd argue no. This feels like a useability improvement
> to me rather than something we want to call a fix which suggests backports
> make sense.

OK, I dropped the Fixes tag in v6.

One dependency to note: 3/3 keeps its Fixes tag, and it needs this
patch. Today a NOT_REPAIRABLE record is only missed because its key
still has bit 1 set. With 3/3 alone the masked DPA would find it, so
if 3/3 goes to stable, this patch has to go with it. I wrote this in
the 3/3 changelog. If you would rather keep a Fixes tag here for the
backport, or add "Cc: stable@vger.kernel.org # needs 'cxl/edac: Skip
event records marked NOT_REPAIRABLE'" to 3/3, I can do either.

> A find routine that doesn't return the thing requested seems misnamed.
>
> cxl_check_for_rec_gen_media() or something like that is probably clearer.

Renamed to cxl_check_for_rec_gen_media() in v6.

> I'd split those two conditions as they are completely unrelated.

Done, they are two separate if statements now.

> Hmm. Was assuming there would be guard() available but nope.
> Was proposed but nothing happened with it.
> https://lore.kernel.org/all/20240228135352.14444-1-mschmidt@redhat.com/#r
>
> Maybe worth resurrecting that. +CC Michal.

I'd like to keep the guard out of this series. 1/3 fixes a
use-after-free and has Fixes tags, so it is likely to be backported,
and an xarray.h change would have to go back with it. Once this lands
I can send a follow-up that adds the xa_lock guard and converts these
call sites, unless Michal wants to repost his patch.

v6: https://lore.kernel.org/r/20261126023520.39368-1-ai@linux.com

Thanks,
Jongwon
