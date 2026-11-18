Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968270;
	b=dZPocrc8kUJaJQDgkYQtikJnQ2CxzJ/+klp/0MGFjHt1L8uCYd4NT/Xj2qoTOtjYKLq2
	 sZ8e1sRHmKDlKqfJRoKjjBxhJXPuP3DWlzcrs/4nw6EbrugTkg1OsNJHTt36FHLNx3Z8j
	 c2uQ8Wf3PDCVHiQ5CPFqBapTGKL48de5XFPCnRzIqufhs9LbyvUr9DjvjGkxxVJ/Hnszh
	 +URoLC75gHZ9/PUK5C2A9r2AFWAURlbFH8/XNOSWX/jBPp5PDj35KSMy6xz2jjHKRDK+x
	 s1e4H2w8/YceQF5zOUeOLrRGCk8O/XI/IR/14QiysYrhx7p+M3i9RUnkuj0cyiBimdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=za7hVhqCXuZnylgObAS3b8lRUZxmuRElCIY9CGv7ZSI=;
	b=JXCEComsByTE1u0fixlJCY5UGKkBvH+TB20mqb/GuRhbjGADeG3klY1QQNZo58niO9gl
	 IngEnr97ql5GQgSo1sGHw87My9EeJNGG6yeo86VYcQSj2Tvfb3kL/8e80aFXHSXHQTcW1
	 Lve57cuN5B4TS2Tyl8jNyZVNSgS/e3KeB+5nC5JyL48+s/Tq4T0BzIOx8L5rcZbXj/aim
	 ebEnLw30Vbioi5UPEBCFGhRRj2C+fZdqVXa8/Eq8PHqlr06oJg8ipJHCk03+KcoZHlj5G
	 s092WIrLaEVxQ9sb+Nx5FgbvELGA8uju6YIu+FJF09zRVUrIyJlmflyGwBw61izBQHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UPbv3cR+;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1757B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UPbv3cR+
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so713251c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794968269; x=1795573069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=za7hVhqCXuZnylgObAS3b8lRUZxmuRElCIY9CGv7ZSI=;
        b=UPbv3cR+Ya0LSc709IdS01uNUtZaJppByTyo/zCLDyTAPttY8OMT69q/oU0XZ7DyND
         z0VldnxPQ3FW7vmuDgBCgaq4sD3185+dnx1bLLLT0RkeHWR+UuARHSGtInhv8ux5ueKh
         ypA2xzMl5O9yUmLDHJboINTRIY8tcHfpDt4J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968269; x=1795573069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=za7hVhqCXuZnylgObAS3b8lRUZxmuRElCIY9CGv7ZSI=;
        b=QhIq0m1oCh2/n1hWo9vp1JPnPOYrXWQUTVZjytShclwT5OXIV9NZT9UdjoW0JBXUAi
         D0eqNlcWcIrwjlIsMm3/kiYeRxdC2qXQkP2a1LGFybw7hcU5PCntZxxc/LamRdT6GVzZ
         mSvBrrHwa/mFW03m9PwMHmk2x618Yuc6o8jiiaxk/GjlN6Htd/Xf5FcJA9gc8yC0Jlpr
         kwyRMISXt2HZJKOk5pzZkVS9DP4WY+UVF/TG2zJb1ODO4Y8+ecbQOj3ZWZPnm00z08cx
         z/o1qU5oKyWnQ81LxTAFaZhLOr6yWf3ssVLgQ3bYFYRyB4sLRawy3pV6tKAhmA4Crn0V
         ZY/Q==
X-Forwarded-Encrypted: i=1; AL+hErGSpD0B2jaYH9XK5619mhghQ7WsKL3hUVfk2Tz69Il0n3OM1KXWgodLSa8s6ZNzMPO2hDOfsS61aCdE4ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UUlQHl9qIrpJaQLYO62XIRMpi716wnY3IvJPZv7G6SQhzLzLV
	kql98/rB4yXgJnACtL6LG4lBUKtSpSLt65bztqy1z1jx8gnTFbzEgjIqvMqiOVlpZA==
X-Gm-Gg: AYBFou0jMC/DzuZoSfeZa86zRNW6yjpYbAVBX/0wgvjURbkMA4NUfVWNR6C3Jt5zL1+
	TUXUG336mTvZSvctN56OBmRJp1Sm4yiEgu/Z+1TkcnCD88L5nQdlJYQzB28FAfooSdu2T2vGgT5
	9Zr9KH9pjKQ+VjtVx45K++R6lp+ws1DRCtI1ymoOuZneI6kIgwsheCBo0/vWXNMqf40TDb+Cw/T
	mTGmLM3bzikwuNE2cwO4lQY3lEhLwHcjINb82RhxUOBX13stzBz3gWgeFhttFp7xuPH1Ro3NUid
	jYeOmUZX46bFUgfh29OtFp+nxFqa8N0ZDfBJk41w42pwOrIv8/I/K9b3FIRmnpyqByH1/rljtej
	UnNAWHhUnkN8JWq7L5HUPCNgoBl30Oe3SkFvKysVmHrN7LG3VSvnLLSsGVLg5NS6/w9VNeTOSmV
	T+Oa4PnvHRGkwjalhIhUmNhYprA2+Yh2j6q9+7bTAML3rw/HVW5HWcwF8DXio4xxKtSy2YZYdiJ
	4PnV3l7KZwUCcwLWge+QAUXifWMIZbCY/5uVOSYakwviLJ91LpEzC1Qq1GIf0NasHcua8zekBhU
	Jn0L74UdptfTHF1Jcbc8SVDlETYQX5P+eR5FAKj7ltYS84w2XlxokEqfBnGfMUypB5GcsQ==
X-Received: by 2002:a05:701b:2097:10b0:1b5:281e:1702 with SMTP id a92af1059eb24-1b543d270d7mr1285759c88.41.1794968269079;
        Tue, 17 Nov 2026 18:17:49 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:cdce:1079:e29c:bb93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm2155994eec.27.2026.11.17.18.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:17:48 -0800 (PST)
Date: Wed, 18 Nov 2026 11:17:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-new v2 4/5] mm/zsmalloc: remove unused zpdesc_lock()
Message-ID: <av0KlWcq9TgxiSoT@google.com>
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com>
 <20261117-unused-sym-mm-v2-4-2f845e94dd50@amd.com>
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
In-Reply-To: <20261117-unused-sym-mm-v2-4-2f845e94dd50@amd.com>

On (26/11/17 07:16), Shivank Garg wrote:
> It was added in commit c1b3bb73d55e ("mm/zsmalloc: use zpdesc in
> trylock_zspage()/lock_zspage()") but has never had a caller.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
