Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645142;
	b=tJj3ccO9xkZjazudZcwPuPHvPX5dHTJBxSSVlCRXt8DF/SyU7BMuMlClyiDFpl+mDfN2
	 nhPYuiZc+cMBRMJvbrZdzdAhzhB6Hhcpxr+i8i0QeYiNngGjUm9CxTbCQGGydxjtwqh0f
	 Lwrgbpc7CKQbgE26DRcR00Lc14wE8OiCDxhiOTaSKW9uWRqPrwXPzb1Ctz8hfZ6fcUq09
	 oBiEbrNypqJWLS6TeDRrSBKVL6KQp8CSOZt8/t0S/zr4TXQbb8XqMN2L9OGvwzDCPZ+iJ
	 hKypMsFl6n9XvAlrU2i79FWM0qwZKjuyZlNuNelyujg1JaAeKQmRxQsTiEWJac2GE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=aKRTtm62UDdZcQ54J0I40J/JAeENeSlNH7NrIsStsO4=;
	b=0400mY7ucp1HIIrJTM/jbM1LDWW+MRwKOnoczo5WB7mzxWIIXQx4ndBa5WkqqMkzFEhl
	 kcJF+j4ICjVcdKHxvbhfsm12GJ8Fz3EDTCBSjgLXBAueGjvodb7OJTyuKLom2i2XIkSA0
	 j2A45mc/v7reHDa8eH5Un1sHl4e+FCPMswiU9NrqQh/rbW8izNmXCLTAfhi5KiFf9i0sa
	 4xeajyvq0IIpBW1DMU/Bug8lipaDIMqDVEPzt2I0o6Yfa1FP6JC9yJ0qZAKErNvymXoE6
	 bsrLhRGV2uGHkn2cBP9fZ/tODZAnpuDO7wIOqIqn/spnEiUUhl5dw2PrSa3vcNEDKLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LU8ZmNYE;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9935F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LU8ZmNYE
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so1241118eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645141; x=1796249941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKRTtm62UDdZcQ54J0I40J/JAeENeSlNH7NrIsStsO4=;
        b=LU8ZmNYEa8Il91B0WjRYOgvdWYw4XvQqggs7fajTqPBNeaI43qn5T9VJYMg4J+ejTb
         TwUYv3rIpHc3TFonssrAHgkL/T667IhTGvreXvL0T0ZnJEaq0LfGq5v4FxhLkGoR+1Bq
         hTPdJ7S9EX+ly+/0KbQMcNGTWztPNsO3KZUkEz8Vx/05Hqc0GxtfqAKOQenaqVwVKKYz
         c9+dafLvOBUlRjcTXdrE9KEYzclKS+njcpYiRREjV1cgnxjg/cY2pGBwTPtDEoRIopNP
         uQoN5td4n8zStse7AMCATlc3dKTR8m6FDAoRse/+OwbRae7P103gkxf6sNevMteJm7oW
         EPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645141; x=1796249941;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKRTtm62UDdZcQ54J0I40J/JAeENeSlNH7NrIsStsO4=;
        b=QzcDQu8/rp6x+ZEp9p5Vryop77XuX4a+hrS/lmxa+0QghxF/hLd3aahjOCBe3ED0Pk
         sac/iiHF7LMH9eWObOuje4WCbNLsQtGvL8l8Rkc6DZB9uQFZRqvZf2s0Cx8lz5qVmOhu
         CMAQd94xshNeL38afkJQ29AttDeSh2HIERFw4IBSbhUvgGTSrKYA0i8TH8KRovkBkTx7
         haNXybUtqBi+NaUw3ookDIrl8kWYKH7FJMfjmDQZEEeSKOK2mktc5HD86b0fNO3KolgH
         aPw5XwGPZp0E/T8rEnZFdVJBQLLqODP9Fj5K8zj6vzGlmvAotSeXErNih+4aCTKFO3yU
         1WOw==
X-Forwarded-Encrypted: i=1; AL+hErFWtxRusUcmDrv8oVDhc7h9H/uFTQPd3l1xc9Bsr0cw1L3BT7G0M/DhlBrD/Uy1SDxUUe3UDBVyzbMJBNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OL4csOVx2zZeTfqz1bniLwgZJNHdu/YrDB3EZCET9R0s/U1wY
	10Qs0lXuxtlxAj8oesVDR8bmbI1RGxanYR6Zwhc4i0WRiLDILYA4G+ID
X-Gm-Gg: AZFdTZdmsa2yuZBk1yl9lZlPPoDIh6fSa2GBqPkhA/GOVTfJMaoU6hXqv9Ue0Yv5R4w
	xiasQ3zG+MOL4fjR+GJz1KzZejcjGxhT5wVSoJNUV4EwSSe9jHzgwuMi3q4ApEu9KsoGWSrTk4q
	obyoZ0kJV4Uz0W01h2eWE79WmcI+KIi/+yzt7Ok3mGqGZUl+X/ccOxf9OYl13ZN3766Tj3TEHv1
	9K6qLewOE+b4y3G8ihs53DveLTMho3/r7yk3gqSdzib7rcGTeN7Nx7DgR5UTuCHwNCo0m62cgor
	qZplEA85wVlUihSE6gVK6Tq1f68zxqxKKRCF3Q8Bjbnd2o/hNxg3bPFtfFd3ceZLMIR5jxV0HK+
	8I8oEAEtxqV6gDet6irLlX3Od1CUPqovOh7qtEm1731l1bpWTrNgQGrrHUm4mkiivVdnS2OAlkE
	RBb5agSNC3E95lFzxXLVxyROcVekh0rspFjzDX5sYdT7jmbkrLW/FCM5vzrfw3d8lKTwUa8lqmV
	2vWOlxgIseOMnBi1yI6jk9MkRg3jNl2ZavACGe6xOnuY+3rIhl0cyPgwa/UNqVnVIuYTkjNMMhy
	NzbNXSMTbq92+DCD+EZz6gHbkA==
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr9731399eec.1.1795645140431;
        Wed, 25 Nov 2026 14:19:00 -0800 (PST)
Received: from [127.0.1.1] ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm47487514eec.25.2026.11.25.14.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:59 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jbd2: Document the h_invalid flag of a handle
Date: Wed, 25 Nov 2026 22:18:58 +0000
Message-ID: <179564513831.2536897.4907315692095561152@gmail.com>
In-Reply-To: <ylfq77loldtcc3nogxtqkwxlnqnqp5d3nvyrl3kezjtxcnpojg@ujgcfjxe7gkd>
References: <20261125184027.2402549-1-takano32@gmail.com> <ylfq77loldtcc3nogxtqkwxlnqnqp5d3nvyrl3kezjtxcnpojg@ujgcfjxe7gkd>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Honza,

thanks for the wording.  I am withdrawing this one rather than sending a
v2: the same warning is already fixed in the ext4 tree by Amit Patole's
patch, applied as commit 008aad6508e3.  My duplicate check looked for my
own posts and for the subject I had written, so it missed his.

If you would rather have the comment read the way you wrote it than the
way it stands in 008aad6508e3, say so and I will send a one-line
follow-up on top of that commit.  Otherwise please drop mine.

Thanks,
TAKANO

