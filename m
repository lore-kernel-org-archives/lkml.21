Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434579;
	b=xM/JY80zejuRYpvQYtuoA+0HDWz7UPi8F/6ux7kQgSCHlXRM1zRizL6Oa2GF53aeMw79
	 /kse/rdGbg1gRmRaK1rH9CcyVwIYQo5iXxVtxq0yCY2PJIRjV/PwPuytgBDBjHHCnD2va
	 PDKZy1Cg8lQ9jLnND69vwMjDMAiC1oQqRf/5j/CZ3VAWCrgLkgzjhCZ5JxQ2E5X+wb7aS
	 aC+mvgqDomFW+P6ORDIIzJaQzhipwwLOO2BvGqvdMXDI2Ji9Pm18GXyNNvJlqJazrtLre
	 GIQXgGs2C41E+U8fjDw8ho4j5gBVA9BGsXmKqjU08ly/W+XWmPUbQy0G5au5nZq4GUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nZFSp0goL8XjmcYoGXv0HxNvOIB0a28cVRyu5V9lYRM=;
	b=QS7syQfI/+gwDBDHhakbjPoiRMlshqNvXm22D56KaBFM98eHhGOnnFeF4RDi0cG6+qDp
	 qLS5S8e1W6PlYK1An0wx6cWWNE8lTV7z2ge90McQkutWlafR6sG4CM31XM74AJtTF+U65
	 Tp6TH3sH2lxpS8EGyYvAjGHRXENKqD+ShQYVH7CQy/0qSMYyj0f296h/ce7hpidlJbyfb
	 yHDXDNf2F2wr5AxZK6DxkfNHSxTyfBy+yTIeDibHvVyPfnO+VX3mkM7VM/oNDbLv+4VWi
	 7PgjFTpwSmF7kU6h6mwGeoLehYEe5DKRa0XCo7e3esd3KWL7HsLL52XOTpgR4JZRjVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CzUJIbk9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E04606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E04606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CzUJIbk9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3025194f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795434578; x=1796039378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZFSp0goL8XjmcYoGXv0HxNvOIB0a28cVRyu5V9lYRM=;
        b=CzUJIbk97RZ2hv1oL8OKSUCjOsRQfOXST05apaPBzb2vINocN92T8ZptDqseWyI2RI
         8KKSfak1QFhbNmJjX66MObskBf3cv63LbqDdu2APUhvGZv6/l9tP6YyIFPHHRgHIM7Bz
         L79AO47Tq2dupE75ljLoRerpugPVVwKfyJ0lepNWctiQSAt+ge9mp4tO0pooda/u7IB7
         EvDpfNbRbgGeTzJiMvSoCZif477XtDiURd7vEb4QJSb48uerbqp2RK1oc2IRPp4FPT7D
         aFYaWcyagfP73qCY4Q0ZnxekA0gU2rv/InDAtUK7p9kbHXwJoJOS9O/teV7XvW8t6Z+a
         L1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434578; x=1796039378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZFSp0goL8XjmcYoGXv0HxNvOIB0a28cVRyu5V9lYRM=;
        b=BKOvVKvKOvxMD0UV4MJYcXPswkdmEUvEgE69srrG6PhW6Arvg270t3ny8ImH/prGin
         xCO1lvdx21AaAUYB59c1gV9x7VMMkksJJn2jeT9hjse0Q9FRUQmQ8chrYQFwgSId/PQU
         0Kr0guZ8Q2QtU0kBPKvZLfgDcYN7Gg7woJ9lql/ZbMu5iZRYrnd5MyYFxD5czhPPpTXS
         Dxodu35Wgn39cppNdG/enc2utV1hrDKP+u4Bq04OWC96JHLdOT6cgILdcGSQch3uJxoF
         2J9GJfjy6syvucnBgh0yDjDZhAFWrsBtX9liucaFocCf/Sj7mvGiml77fNFhGkHvZhJu
         jT3g==
X-Forwarded-Encrypted: i=1; AL+hErGWpUxEV4nD+8XvqB/j2OzdlkPRDjknPD02UQpRACHfPYInrY/hBkyzP4ZFDTE8DciQQeCC+pOSmLxvenQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A7tgqwqVRtzXCqAw9STSQKjJofrwdzdif6Y9QVKqK5WoqrTq6
	NU48sT4PcU6iMMS0PuFryi6kOxeuV1uK0E6GIot5urA2rk1sYfK7YcIhPSWL505veA0=
X-Gm-Gg: AZFdTZfxVzON71OPxanN+55YkFlb1N29sxsDazm7JlUCbsibp2hsWv3rfhKfkCkovjZ
	T82Brm4dpMKAiYQg3lKSmsDI7qapOm+5vPOQgMfrRbO1hKImEb36Nl5rvilw1q8LTTrqUGkTfIv
	y7vtzL4ofMoB5T2DGvsxb2H9UzLkVyldF4X0ml9OYAwmjKhrwYUAThN2Oyq8dWBF1RWoPGTL8cn
	602uzZe3CSQJoJYJqjt8TlpSIpA96bWUbtWE1Bw+MHLimWy7AFIh/O5dsvJhOkxjXw1AEdOKfur
	grS5gW4tvLkKM+Kkkwz+0SE2KeJOh+sUIyeDqgJhf+8SeoS/GyRPej8pYx/hcnji+6+TMLmC6nf
	zHuLtZ2o8PH83EvelNFCqu4Hj1zk/gClSC45yamC5Ey/frXGRihzUEX3AGhTxVut4twvmdDLl1j
	gwWWcRHFJ1g8Tr3pwL3Eg2ny2KYiIDhcH2cxQNHfU6fw3JYKQKCyVuLN6Pkm8M7PlQmzNkOxoO+
	/CNH6+Sdf6+iNrl4+uz8QiU6ZLeSSsQ2fvj2J62WjfGaoVPR2nmMbi+auIzTdzO51LC5qqEIUs4
	6vJI8YLXM82jE568Ewo6vNvI0hQgJGwna2xiMEFMYgBT0wQtuVk5IPmzJy/8p7Hj
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb88820bfamr238565805e9.30.1795434577759;
        Mon, 23 Nov 2026 03:49:37 -0800 (PST)
Received: from localhost (109-81-82-199.rct.o2.cz. [109.81.82.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm495277235e9.11.2026.11.23.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:49:37 -0800 (PST)
Date: Mon, 23 Nov 2026 12:49:36 +0100
From: Michal Hocko <mhocko@suse.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tj@kernel.org, akpm@linux-foundation.org, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, penguin-kernel@i-love.sakura.ne.jp,
	mkoutny@suse.com, chris@chrisdown.name, cui.tao@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3] mm: memcontrol: don't miss processes whose leader has
 exited in OOM scans
Message-ID: <awQoUGIBitX_uvpP@tiehlicka>
References: <305c5803b904a57c188b505d6ed9e1e4@kernel.org>
 <20261123113951.1771223-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261123113951.1771223-1-zhanxusheng1024@gmail.com>

On Mon 23-11-26 19:39:51, Zhan Xusheng wrote:
> Hi Tejun,
> 
> On Mon, Nov 23, 2026 at 01:13:25AM -1000, Tejun Heo wrote:
> > Maybe the leader can pretend to be in the new cgroup instead.
> 
> Thanks, I'll implement that and send it to cgroups.  The memcg scan can
> then stay on CSS_TASK_ITER_PROCS, so this patch is not needed.

Thanks!
-- 
Michal Hocko
SUSE Labs
