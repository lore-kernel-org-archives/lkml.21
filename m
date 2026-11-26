Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686840;
	b=LQj3nMhgk9zOPynDGcwj5lKkmPnEAHcYTEuThMTPL2Npsgot4xZa5gUCoow9Gefpigm6
	 giCvzvZ/RPT7lzAkRQZIqAZrYF29RQWz/lfGbTchTGFJ0W+eoio2azVW0a8zbgYZ1oU8T
	 qBZT2kDP+78k5ZlWFXYBS5imHETUiB2t4XR6X5MYgTfgtmhPpypIGtRjHKu/rEzzOE+wS
	 TlLQr6xfHpDMMLPBiPTE9qYDtflO94s8qKMVto8d2Y/b/h9LbMbbkwqpvhU+YJhYvW4F7
	 x5Odj8iWz304IYhFUbe2lc+5bR7vbfILJsV35v+QexhWKZU5JD5Zu5hK7TNgBFYv6pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686840;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ukj4Sg1+w/27c32YNvtbbyMue2DoY98FNZztnwJcgds=;
	b=1ZMzwoMAH7oAyRyRyPPW5p3G2jFOe4ot59y6OsYxTwg/s9iZswvIdznN6i6pCUgU1TjA
	 j93l7QLSc4t7gp65yaoq2A8fCQ5lD+mbnKdPmWtLPx7hINlsr1yTeivstJ7Ir1oAA8NI0
	 kkR8Pd4qY1mJbda3ikDO5loN4XhhVu8lAl/ViBATTqk5bT6FyzwD7/k11R650JjkoWZ0v
	 SaX2AE2T0dM8o0V6lO21LRVhxdTP/EThkiHe1llk24SIlG5MipFSH3QEkznAAZtjqzQK2
	 Vgwn7WX0TbJNmG+NoOFuj7/ciuzwzZlZG1y0isSYKbslb/7C0CSoXlILcE1F4Mf4OAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY16v88n;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rtCVpY3Q;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB945606A6BA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB945606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY16v88n;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rtCVpY3Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukj4Sg1+w/27c32YNvtbbyMue2DoY98FNZztnwJcgds=;
	b=SY16v88nCYH+/FQLHCX37y0MOnVKaaOSU4RjKl81m9ymAgNAGOTOTeBB/slcvYkv/T2Qxw
	CqncHTRwMKVToiezK+/CzTy8gbdgEhIA05TcTrEYhWtXfp1GysWridwzbh6zJ/RGv40NPF
	upHUbcoYi9lXYPz6/Ygr5crTlsboWzs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-j65PlhvJOsW_t46JhYTY2Q-1; Thu, 26 Nov 2026 09:53:56 +0000
X-MC-Unique: j65PlhvJOsW_t46JhYTY2Q-1
X-Mimecast-MFC-AGG-ID: j65PlhvJOsW_t46JhYTY2Q_1795686835
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ad907ca4b3so28320891fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686835; x=1796291635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukj4Sg1+w/27c32YNvtbbyMue2DoY98FNZztnwJcgds=;
        b=rtCVpY3QUevz+szUkdCF1DEtj2KAkxoSH8dDbG1yI/mjwfFAVIKJgFPDKDYtYEUFop
         XTHR38zrNoowsBTtij3m8pPkYmOiyetTzTNt6bHnWffggRVk5DLoKGO+CUnwKMj7m7j7
         nQ9ZZxgUBSvG8P0vxENmaHpBVSPX4YLLVGpIvTfw8oU/1AkRHlvU+WLVGog59De4BFTe
         F4Hn3GtX5GyU+gsNzRfUMiAln6nezS0r7scs7qtEUs37RdO9X1CrLEdxtZrSNfnnPDkB
         x+izVKuLZVIQam6J9j300KMAB8Uf6XMKXMQOqrrJuS7w/L+GcXmwvHV66Kedn3ooGS58
         Zilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686835; x=1796291635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukj4Sg1+w/27c32YNvtbbyMue2DoY98FNZztnwJcgds=;
        b=eLVNcrv46d2GDBh/XhYacDo4IiUvJ0M5NA2bD+9+LwxKv6sgA3EUEEs8FANHw86tbP
         tw5hGiUvah7ig6Hd0/aXhB75nF8/EHpeZ1I5crN4MTb3287Ei5AzGon6Cv1ip9vJaSBv
         IFJpxFZfYV0inx8Un60w3q63sBE9PFMC2N9R6SvnYVBcg+Y63O07YoGshNxxALUVm7QZ
         1bjuUdvl8d5NYI16KqA3LiwIhg+urCuUQdQjOLME4pHfOkLKiEKMSwQz8VEnCqfkCTTk
         pvybF/h+/+u7E2/8sCR3ybQnZKTPCYSv+7GyAgSDUMn+pLEO7BocefDW1pdcg6a9K6cv
         BAdw==
X-Gm-Message-State: APuU4Z9pCAw9SK+HQ3AmfV6/RZTWWPetoGNgI2M957no31yEYb5Keynd
	SlRKlukmD7Q8s/2DBrKHgEQDEEfqPcEw9Q3WVVnIkTjQ09vxRZNMGSsYHaCnu+VBn/ZGJqLbZzt
	reBWYXOj/UBzOiBe8g39UBdcG+MpWnBkTAa3lgU1RbQ0YPy8IlzX5WqWyBJPvuQhd
X-Gm-Gg: AZFdTZcL6YeRh9Mpp0KxN3BfTcS0u1e5d9wIFWur8m+pnvi/ftroyIA46ueCeX4aAIs
	XsChS5trrhySlHUWmj/a7WCX8IM81EqqWx5nFy04uT1p1c8X/IsAgncBhoy9Y2Bzpu19phgkk1v
	Uc6RYbccbubOJ19Aq56iR4DLP27dSTXTP+4RZLyAzZ3OTFthGLKAIlwVR7Lwlc7qQhuWZsMgDFa
	sjT/EVSuVPcrgnr1WDwAfuuTBstXlcrlVaxVhW1/piH9ElFncmEQO8y9ynV4zDtKE1ULoQ9lZS2
	9SCpb+Ywpph2RtBfBMSd8Y0cHkXRtjD6dmAnzdEQ4e2UaVFp5QuF2GFrkYv8AC7yxs81f63sTcL
	D6Pni/4uWM1983P/Hf5FTVEfU4ycaIXp9oYGbc05nKrFbjBnh9Dnq8OCbFMNaH0PXbMxCHC+p8q
	qJakWM
X-Received: by 2002:a05:6512:3093:b0:5c1:590a:ea5 with SMTP id 2adb3069b0e04-5c1bc82196bmr6367940e87.36.1795686835212;
        Thu, 26 Nov 2026 01:53:55 -0800 (PST)
X-Received: by 2002:a05:6512:3093:b0:5c1:590a:ea5 with SMTP id 2adb3069b0e04-5c1bc82196bmr6367930e87.36.1795686834668;
        Thu, 26 Nov 2026 01:53:54 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm5099396e87.1.2026.11.26.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:53:53 -0800 (PST)
Message-ID: <a1ac4efd-7d77-4352-93bc-44c4d2650ab1@redhat.com>
Date: Thu, 26 Nov 2026 11:53:53 +0200
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
Subject: Re: [PATCH] selftests/mm: move the HMM migration benchmark out of
 selftests
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Balbir Singh <balbirs@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20261126025653.1344932-1-balbirs@nvidia.com>
 <fba23668-add0-4787-b027-bfba1f66e090@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <fba23668-add0-4787-b027-bfba1f66e090@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 08:41, David Hildenbrand (Arm) wrote:
> On 11/26/26 03:56, Balbir Singh wrote:
>> The HMM selftest runs benchmark_thp_migration on every invocation.
>> The benchmark repeatedly migrates buffers in both directions to measure
>> latency and throughput with and without THP. Run it on demand so the
>> regular suite spends its time checking correctness.
>>
>> Move the benchmark into its own hmm-bench binary and share the device
>> fixture, buffer helpers and migration ioctls with hmm-tests. To run it:
>>
>>   make -C tools/testing/performance-tests/mm
>>   sudo modprobe test_hmm
>>   sudo tools/testing/performance-tests/mm/hmm-bench
>>
>> Drop the 128-PMD buffer to bound the amount of memory migrated in one
>> measurement. With 2 MiB PMDs, the largest buffer falls from 256 MiB to
>> 16 MiB. The remaining sizes still cover buffers smaller than a PMD, a
>> single PMD and multiple PMDs, with and without MADV_HUGEPAGE.
>>
>> Call fflush(stdout) after printing the results for each buffer size.
>> The kselftest harness ends the test child with _exit(0), so timing
>> results still buffered in stdout can be lost when output is redirected
>> to a file or pipe.
> There was recently a discussion on where to put performance tests. Usually it's
> much rather tools to test performance.
> 
> So what about tools/mm/ instead, where we also placed gup_bench.c ?
> 
The slimmed down test runs very quickly and with less memory pressure already, so maybe not a big issue keeping that in hmm-tests either, i see the value of having all HMM tests in one test. 
But tools/mm sounds a logical place if want to separate tests.

--Mika

