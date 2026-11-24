Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486970;
	b=RSyP1tlObxilIiyrF84nrNyvXHP3/VVmazC08/VNAkaaGh80f628JpgCaNnNeDZroBlO
	 dsTiyAolUfwMBlICONHqe+Bk7pPZGx4ZiReC/OBAfo7QEEc2+Th0g/MJq4Q51x92++M0Y
	 cou2Eb8OtqEjw1MDiNOARl3KAMvC3deJRl2kKMO+L5MLN80pGkOWdwfKWd2aFwq7b8Cnz
	 A4pDVEKvhjWFfwBE+EcOCeB0X8bNksYLSVbCWu8NEcO1jHbiiL0UbgPCgHspIim6Iir/j
	 Jrlz+xBUx1r2jkxfHvLHZOgtguJ+8AcLGbglkSqL5a+jTQbYhIGxJKJ2m+2hq4IIrOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
	b=w+KeetF+jIvHTERTEpSORR8R89DalAnUDWGPvPU5FIvsjhN7sbbeRqcdTxoj2QBsogOm
	 Lrj4uRtJoD0l1/rslVNZ8JGUxx4uEBuAz4S9ZGavUvLky2ZLVCCOIvUKjOa29ZCqRXB/i
	 Q+uXtM8O0ND946QQ8Ma7NSKHYDyd42uyOSDr58vea5WbDMQj4nYNVsT0onDhQz4LXTcWD
	 UzrKbCohKoLOXviwRGJO6mFUSiY+muUhQKm64cr5czpob11fggSNoMr/ERy8C6ppDE1kv
	 LOvZ3J17TJbKV/TVY1DVwXvqwQS6zgOLsV4evekoSlV2UE55RwXjVCXGyk3w+sBikJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxUXIRv3;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA384606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA384606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxUXIRv3
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04ad2c46dso21966975ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486969; x=1796091769; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=pxUXIRv3cNSB2fqhDzEq++taJVOXNxAsvpFFq4Z3FNDeR5u30E+syPLebzg1eYZKLf
         YGgYq1IXu1w62prUSCJ9yS3sMns40V8A436JulB0ngMbk7ECtZfjPaqS/vTAJ1sE8S51
         sVrMvuqoDds7otX+oYwC6TJv923S32/I76VkOCJBgwbFe/L1yxQAcMY61cAmzBhRGo/U
         YZr9wQjKfOZ8b/L89E+4OMPvLd/igSbCy7sTLVtW6mP35fFVc1ocWwc/K0ljHipxMWYF
         74mZC4tK5qHo+jk+yhL2WqLBVAWy4aP3Ne2q2m9DU8bVoKabcH75oBlkAeKApk2cgDam
         UigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486969; x=1796091769;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=t6BkMhtJcWjgSKjVRGqsGqRB+oG5tEO1bLEDVQZYOwvG+ikyYFFnWFzDmQGT/LXaR5
         RQUsX/xPnSMuXXxi4AQDo8VWIuEWJIMCoKx2VyEgdNKo6HW0MrxncZNWmSl2t4M5HZpy
         q1Gp5kxWsuTJzEg1q1JANIKIgW+WsNTRk3XqdfL7gej1RngpQiA0WEnvRZ16q5CCjOk7
         hR/c00wzt1WoQ2nPbE7+K4hKbhT/kSXM54H+hBo1w3LVQaqfmR7+KW3C4QSofD23G8zs
         BSw72btxhBjgjUPShMqPjMde9cN/57RWxc75Pezc6077R1D2bOHWSPORmEQ0bLF+R+GA
         y+eA==
X-Forwarded-Encrypted: i=1; AL+hErGxO42kPpvHoJvwb9QaKczi7cmMSeAP9HzPKzFMfqEVjIFS4myQEuqpcFtIxUHRu62dDtbhSzvKEf1qvOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nlqn6lvDJT/TdDQsBUw2xUqX/4FZGQd5iOZkM5r5am02KnjjA
	CoBLVfgk84FveshI5VLC69QVhA2j7ozcSsMAQFDDiYFgImw9RF5Ytwwq
X-Gm-Gg: AZFdTZc6nxp3SnQvrS7+NE1I5xOKB6nhoCY6GQLdDef574VrSmUIU8V+WFpN7kdugeN
	XcQoIoQtmW02mHjwafbzBARuEvLRIKqTpUMSWtghXmJ1A5DvqpgYjfy5wpg2KCaWzuTW6SkQc9m
	ZucanUkFvL7V05Cgh1d8MxoQ9ir0hz5Bz0Ijm3N5TsKcEKUW2/Gq8TlwmcfRawEZJ6GrXKdRy+O
	c6TLMe0tqv/eQJ0rmrARVaqlq+2SSp0hJVPcdZGv3sa7VJIZJYi94jYgjjOi+Ggg2L0My8cYQNp
	FDGN7TzKit8cqHN6FkFZxFD356ltQw7+B1LENRQBKV6NraQYnIA0CRj03EuZlHKOkXalzHr0jtZ
	NDJW/qU5Y2vETri3UZNZpRkjbK1EyQcQjAYv3pxkntyhnjQwWv/HNToO95yJOubjpYIm4XBeMTg
	7lfoz4R6dOFDnmmE308QuFc3cW9RFZxiXutMfsyNyn7rYp6pK+7IGM1UqopKO++F0Rb934Rr6qV
	b1pVD7wBFZyn19s4/6U5ia0v/13wlY4wKZy/RtDAoPCXgNm02SHLMJJUIboZ7RZvYk/gOdwTR1l
	1O/OcLeVJF5Fd8uAEziphe9FlklQGHlWEr/G9RCJqOTYG0t4sok/c1la7BpM6CG3lTfseUhv6UU
	vmq4ZTnKupBQ/Kj4ckVlfFa3/
X-Received: by 2002:a17:902:e845:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2f03f17d16fmr137924885ad.17.1795486968838;
        Mon, 23 Nov 2026 18:22:48 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm51794725ad.19.2026.11.23.18.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:22:47 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] thunderbolt: cancel the queued control requests on
 teardown
Date: Tue, 24 Nov 2026 10:22:42 +0800
Message-ID: <179548696261.1834925.3608072470968351391@gmail.com>
In-Reply-To: <20261123055240.GN229695@black.igk.intel.com>
References: <20261119075557.3399335-1-shunsheng1218@gmail.com>
 <20261119111907.3616041-1-shunsheng1218@gmail.com>
 <20261120042721.420468-1-shunsheng1218@gmail.com>
 <20261123055240.GN229695@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
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

Hi Mika,

Thanks for the feedback.

I don't have access to Thunderbolt or USB4 hardware at the moment, so I
cannot provide the hardware reproduction or the regression testing you
asked for.  I will put both RFCs on hold until I have that evidence.

I also take your points about keeping the fixes small and writing the
changelogs myself.

Thanks,
Yaohan
