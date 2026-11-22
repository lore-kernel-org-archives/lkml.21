Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369028;
	b=rSEsGQJeTZ6rAQPZByrz9inhy2pabSjWqb7+d/eoTck5xOb+Q2ZGomcIZh25KsosLwOj
	 DY4oi7B2rDU6XFYyTkhGieipjHzQjJaqtBwENhNNKrsgTMXgojcX17trhFmfyjP4sOG/F
	 Y8We9wEVcUr9do6tgHQ0HbBTRQy8qEJkmdE9EYswcQ9sbKQGefKp0mB0SENMb5ciWOje1
	 JxZiVM/RrKdtqXfY8kjpmn2geXcX03mwMAdvqr9z5eF7+H44KgD2yU3CIhsKsDLTc15jx
	 B/uGNyJ6i9AK616qSPd3XLK+ypPD2g3mjcBuS/P+O3mISqh7nf4PMH5u3a5Q+iNXEXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
	b=ad6hXKkuI2HKOxevCXfd43wnQ62rhgy0ob/sjAvo+CbKkycg6qN8HsRDhDL5pYfPH1lo
	 rOYMrifO1o+LoO2k3sO73acx4NTbUt6VWHH7iiguCmzgVo/x/hYWcfWRkKxWHkUjeQaSk
	 z+HbxVxzVbNLkhs5ReyAiJn596cO/RcGuBYvjmVPJ4p+BaKGiaFIQIO2zUDmoi/On49P/
	 XLiRFOAeqQQrSZr3X8zK7kqr87+hfgClWVSs5mZwpTFSdOAX3Bb1YU9JPFnkijQ65fpQO
	 sqhXnq4osT/OMMsbpoZXmubKIwLJ2amTt4bZLcxyHf6NiYzCYWSX76VGOEuxC0fQwzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HSsR5n+e;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zdx+hJeE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4050606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4050606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HSsR5n+e;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zdx+hJeE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795369026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
	b=HSsR5n+eMBgLIxK+s2vq2u7KgDqDTdXRv7M3rE5hjBJDUnCtmxldmAhb1I1OExlZyWcRZk
	azajeQL625+E7sWmQgbrFDf8+V4Y6HTsPI6KZYqFJPMpJZmSXeZRqQM/lxZNsh0Z6/Zljr
	2o280ifcGk+8j/wE1SjBWZzxtoIA/nY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-pQz7nM3LOtyyRlA8dvUlNg-1; Sun, 22 Nov 2026 17:37:04 +0000
X-MC-Unique: pQz7nM3LOtyyRlA8dvUlNg-1
X-Mimecast-MFC-AGG-ID: pQz7nM3LOtyyRlA8dvUlNg_1795369024
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532f343a55bso47353751cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795369024; x=1795973824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
        b=Zdx+hJeEh0MenRAqMOKWJk2CUx5CVTYwSVhnSyUaOiXIxCSUWbp4Na9pLorxmly6hO
         mdrGBnD/yz7l82OVYHzDBOaBWRyQqXPfsYzNWareW2vOMCNWFbkm0qrfRbT97mh5U4aB
         UyaIrmOxtoWqLZf6JjML8oRf1+d9CabovBFKTr1AxQcfDlrhU4QPI13j+mni4g4Dkm1M
         wyI0RL+gqySNe39wKZJYHM9TWhdc/AkjdHTR2ywlKSJ9sbT9aaFaVJvF80aZtLyh41S1
         NxS7F5doQYEyYXgV3SiIdzf4TlhtytprQy5GTMwkqgF5FhTouQUN5g34cd1aGukq7a/9
         UB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369024; x=1795973824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
        b=irD9RXzyStGIwR1CdH09M38yojDnV0hhfp4HH+Z8AEEnslALRT0cVIXWVMFq/r08gn
         V74Dg9MPoYli7kuskHiE3Y9tQtBdpWecD8Yjyevjj2+hkfJrwAlQiCv6Ws61tSCmAIr4
         8v6m+ihFrhGfTLNaDmjKsVSAO+Tfym1s9EaRq43fw3Ve1ZDTwKe0kuM5nKIWUMFDdGOv
         9hZKppmcqGJDrGUlZNwP9boqYCF0AspU+DkxisKWvpQUJEnm3r2klKt8y3xrlucLoV+O
         /TJ1YI17s8WWucRbZ+dJW+mrSlMeUwaPmeP7giGhMuawtQnx2vAsnhHV54VwFMmFakfZ
         K0XA==
X-Forwarded-Encrypted: i=1; AL+hErFL92AgcdzH1LLlcX3WRVu+a8Ni3dq/k9OOPYT/N3Xxbk/D8deak/4ApVgyACRHvOSsuz2xU8ltKfwAogI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BnBQNHfJp7fCnr1vJypmhJjN9FmQsyS4pCkDBD/mMji9LgvyO
	nks2/ip+M3+zST+aP8BMVMrhrTjQtOjraAUNMOSmoH3igE0utqX0VgqG6Qz3VpT24wg6EGx+uke
	osI8pilnH43UUC2/vARhWTlNj+AuPQ+3KJylr0+1Y5yf1krk35l+Eyq3hPkMYtevVHvuOsw9jTl
	D/
X-Gm-Gg: AZFdTZc1n/k6Zdxw+N0xtNmcqgjpwKKbgZyYfESIJL22cm2YOQxpVx/87ZhdsaOHUtc
	Lj3F0Wvxb94aLFPr2492RcW75ZN4ClMei2es8PRBpJ0kW+DBRn9zsX+t+B2kffpRAnlCGM+jrHd
	NkxXoVXDDQbebETzOL++PH8DhKdNAGMemlxgI1ozSIeRUKKmPA5XeI44YxEj6ZybqIUNbMr7HyN
	FxqVu1HMXLXsbR7FB4W5BZ5/79RWd32QtxLPYmyA8feTWvGpOwoTr6mrvBluFG0ADamsewNSZ9y
	Xz2DbLjvQGiV8VGV7UNF7gHzaNARfeg7WCiC/TdWOlkJXHAxNBmHmDURKRz+5jEJLJ72Dbjv1GP
	bR0gEaIqNws6/KNl7id9euA2bL+rcTYggEFLah30QyqsoqGVx848En5yAIzyuL1ukGFCUILJm7d
	tJzhjQDOZerA25RBqdLbt21ta7RZLfNlJcYSlD+Dqm2gq/boa2KqK33cq5Soyv0H9tEC8H3LonP
	INQZeEANHqXJuZrKsa7Hzv9ryq2JINXIty8245WGShh64eMYB+r
X-Received: by 2002:a05:622a:308:b0:55b:f621:e7cb with SMTP id d75a77b69052e-55d76a6e9eemr177660911cf.21.1795369023886;
        Sun, 22 Nov 2026 09:37:03 -0800 (PST)
X-Received: by 2002:a05:622a:308:b0:55b:f621:e7cb with SMTP id d75a77b69052e-55d76a6e9eemr177660721cf.21.1795369023504;
        Sun, 22 Nov 2026 09:37:03 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7c654585sm71310051cf.5.2026.11.22.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:37:03 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Daolong Zhang <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ceph: add compression_hint mount option
Date: Sun, 22 Nov 2026 17:37:00 +0000
Message-Id: <20261122173700.1281165-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1795169573.6B001D21.006.4jWB3k0l79z3mds@fangwg01>
References: <1795169573.6B001D21.006.4jWB3k0l79z3mds@fangwg01>
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

Hi Daolong,

If a mount starts with compression_hint=compressible and is later
reconfigured without that option, ceph_init_fs_context() allocates a
zeroed options structure and ceph_reconfigure_fc() unconditionally
copies its alloc_hint_flags into the live mount. The reconfiguration
therefore clears the selected hint, so later writes stop sending it even
though the compression option was not changed.

Could the existing value be preserved when the option is omitted, while
still allowing compression_hint=none to clear it explicitly?

Could you also check that the patch applies cleanly to the latest
ceph-client testing branch?

Thanks,
Alex

