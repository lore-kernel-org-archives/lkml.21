Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709408;
	b=zH6H0AJIapnALHzjHiF0dfuXOHsnL5QWSh/dHlDvNWNA41g/HsZmb7C2wS7u+OvoSscj
	 AGPlTFsMbw5Mvm4cVvdua0rXHnbGjEcA8BUqHKGUye4dgeB4hrRnSAyKqBhRMmY5kEZ7s
	 Exgbsm4vRaMrhCVVWN3g/A+WnwkPIuO9ploOu80KcQd0NZZx+SE/Iw+H129PywVfe+6vx
	 52vThg0flIQkiuutxHFl9qAWxXrtukXvHhnxOFnO3MtPCPS8QQZ3T15u5U32V005UqnuR
	 PdX1UrF5nkWuCNGTzW3sWg2ZzjZO41hMTzqzXECrns8gZJpr/D7ecNRcYcdRFs3tJOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709408;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
	b=Zy9BoLmrCUfyF2KkeLACmR0N5uYdjP90mdIrpw83K8OrXOPaQoaZabyRfXYvxyuezyIO
	 TcKYqhRk5yosKIYGGOGJYbSKnuFlXjPWL2CjEqeH+w28klKjS7h2dpy3hPZ8sBntafD1I
	 RZyvSL9jse0V62Byeqgmh2D1ZcjUbzogB8k5HQEv0kB0fu31i4/wSf6tC7gb3JNwc9IIq
	 fmss6BheITQ4460OduMRE9Om2GC8CHkMhAwcmy/N64BGdUrUnMxTD5Y4rKEwZfep7KOBF
	 /oW1kx3Dt10NbxvpbmtCUB4cWMyS3e3DIKxBghrJibYITYlGc1WsX1U+mlQVFmhVh/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d3fYmMUp;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ObNigFBh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45808606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45808606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d3fYmMUp;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ObNigFBh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795709407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
	b=d3fYmMUpdpho+a1ezTY1dNSj6NW7jFOVTJoM4+HtJhU55vy0Ox6BtpBQ54bgePY3WP0CGv
	dpr5Qwvx6cs4Iwi1PDMgUSnINA8BCV/5a7X2co4UrSPCudImI+BqMi/A7sR4CLNC+lr7em
	SlgCP+C8rw/jDTSAdGI7pv0uEP8KtqY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-WxQn-Lr6NuaqtX-O0BIgqw-1; Thu, 26 Nov 2026 16:10:05 +0000
X-MC-Unique: WxQn-Lr6NuaqtX-O0BIgqw-1
X-Mimecast-MFC-AGG-ID: WxQn-Lr6NuaqtX-O0BIgqw_1795709404
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso51442505e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795709404; x=1796314204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
        b=ObNigFBhOx+JLbP6N3ncQjfnJzrL0TpzPV6FKj3GydJWyT6u2kx8aFKE7UQHrJJ7ws
         RsjH9pc5WW9+UxEckClkKvS3h5hoINrCpIuchDZGlHHydPlI2npU2H+uz01vLy0SX0Va
         x5kMuVsk0dHYDLGkQUCUOOyEoUfx0oMaF3YIuFW5Zx4LRj+9ylWCkqSnb///3OdrWllg
         M7Wr6XXtQVbwJnnRN2wamIoBsDK3hS8BuKPSGW3Q+wkaPC+ejbYdXNY+7dM4QHX4p/QK
         c5MuSd096oMeobFfm4TQ8CBBBFBblyJMhYmFpxaaO4DycOb3euoa1uP97nvD4+gvVYeL
         sChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709404; x=1796314204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
        b=TZvuUfbQr3+najCe+Aut1G/l20t45oZRpV9Ul2MsxzUB1tkeBaMLs3V4rkcCVj7Nfj
         bzz32nHInkLKe1MRT+8obn0mS2R44QRYi3QckeRO+Khuj6nYx4cjDfpLYlhkznZl0e4w
         gwuA/1dlWWxSHv22bQUAWpHjoF+Z3wJvHqDlCyuRTP+ckWdKPS84OlZKdewT64dXMj/C
         CfPNMZm1UzI4X9slCc1NxHcBsdcknTjgSyDO9yhMNg2BsbZPq+aw7DighSgu5F5G9LWx
         vfohfsLh+72y2TLXH23l9Yq03swMNEj3skfSRqWDvXJ06600T25697BNtz3xU5mSfaK1
         3PVA==
X-Forwarded-Encrypted: i=1; AL+hErF0+Xubj+QAV1ckiQ4nxh45Bl0nG1vhaVwb4C+3U39dVxe01Jr7w3t32d8KFp1oPsyeXZiMriGOgdzEtbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9MI1JcFSzx45IVWAU5jtrSnR+3TS8hqfj67KbYfd9tzk1DfKQ
	H7h9cIO1BNwCxwq96W/H/EhO3qMQb3EhQT0+aRGlaD8ER5jf/EJHBNgC0M5p/VVq6DFEQQ7/Uve
	KtW0d+vrj12lfWmPr4ku7eGE5Ysk4WH1DtcPIiyg4UgPZSsukSTPfng3QBO1fQ6p7wA==
X-Gm-Gg: AZFdTZftCNs3GtYo1LmoBAaQG898sd2HbNqI1DpiIyku8Ho0zCMF12cKGhTQpkHJe8z
	RDUbiNTrJ5H3vauItLOutSYSyzE6aZxSIyT8F3srmRn5xOGa0Is74Qfx86YbBX2oF3qTVDuN0Tv
	hLh0bT9gd59JXqHFTzaVNVc/Mytf9O4kQmYAxmoHAbd9+8ACszhWjXlPPFyZmMYVuqJJCs2IsX+
	Wo0Pp5RBzAVTfHoNia2BlFpaFmIjpFtJna/0AymHfHAUvWnKtiDfT+Pt6Z/unFk4dDbKjl1omaW
	R9HRLx8Zh8sea1i2N3HJRlv1TNaNOx7e3rDx3QAxQ8MaVrvqe+/A9DTIu7rxYxLSRj1zOC2UfIP
	tH9xV4aaLI4DuL/08BUf7Tutcx4C1B/PI1Zbsg1FYICgeSyE94CwM7waM6V+yCe5AUqrtlnGw1l
	ISL/90LvFW9cde06AZPERuksDriD4BF3b/yy+ZQ3iStbxH
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr430750405e9.2.1795709404066;
        Thu, 26 Nov 2026 08:10:04 -0800 (PST)
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr430749705e9.2.1795709403638;
        Thu, 26 Nov 2026 08:10:03 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm622216265e9.5.2026.11.26.08.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:10:03 -0800 (PST)
Message-ID: <bcbb57bd-6447-4faa-a56c-9bdf1c7bc90a@redhat.com>
Date: Thu, 26 Nov 2026 17:10:01 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 4/4] net: skbuff: limit folio refcount when splicing
 from sockets
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kiryl Shutsemau <kas@kernel.org>,
 Song Liu <songliubraving@fb.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Rik van Riel <riel@surriel.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 stable@vger.kernel.org
References: <20261118-skb_refcount_overflow-v1-0-5551b4954c3f@kernel.org>
 <20261118-skb_refcount_overflow-v1-4-5551b4954c3f@kernel.org>
 <14059088-7992-4d89-ac6c-1e6d1f61b3c8@redhat.com>
 <832f42a7-1d44-4138-a7f5-7cead4a28e57@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <832f42a7-1d44-4138-a7f5-7cead4a28e57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 15:44, David Hildenbrand (Arm) wrote:
> On 11/26/26 15:18, Paolo Abeni wrote:
>> which is arguably ugly but IMHO no more than the tristate
>> return value in the current version.
> 
> That doesn't work. "len" you write in the function is not tlen ...

Sorry, I rushed it too much.

> __splice_segment() passes &flen.
> 
> Further all these lengths are unsigned int, not signed :/
> 
> Also, I think we have to respect spd.nr_pages.
> 
> If we want it minimal, a separate error pointer might be the easiest way to fix it. Still
> ugly, but I tried to get it clean above and there is no way around some churn I'm afraid.

I actually prefer what you suggest here more than the current patch.
I suspect Willem may have some other option avail, but he will
not back for a few days.

/P

