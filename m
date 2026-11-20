Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186815;
	b=GQN2+VfWneHwFHAKrUHDAoIxnerdHczDZbo0rJY5ECOJMjF5CH2XDr2r5kn2evTbZTA1
	 RpCTCWv0LbaT3W8keO6ArrhaRn5nxPwsDo6Obrd+i9b9m6lkZFZWw2s15euCzJR38qw2Q
	 2gXYdY0C5ZIKSrgS3+n0sLWp4buLfFHYj7dr7vE0Nzb8XnWCE2G0G1pNoz4aevFT53YJW
	 4ARAvQecpuZAa07jGyYCsauWu7zXHD6UYWC7khrGzYrGF3VwvlYRsq+l6c3AVPVeeqdCH
	 Chso5CD5HkQQBFTJAJwha9SGWwhTpp+uapfzCbRO7gqHn0tOYuotqb0zHg34MtveitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XHBcZQlUPQsO0ifHNy4xpiTb5H7JDbYhI3unlnSE//U=;
	b=sqBKnnT7VC36TDf75bTLja1Hzbn9DbFzYxQHdd9Xw1knybREbRvhKkU6v5WVaCy06Bsx
	 Ty7xWByUIW2hkxRsyWQc63DugBIV6f6qjbB+idJ0BmMuQJbO9glqBn16kPkEcU7uPBX2r
	 B9RnjfKFucXJ0YUlZI0EAHa/e//c5ccJr0hrQVO6GdY3f8286RdaW/wVkOLvGv7S9zLWN
	 WGQoiXtxGB9FkNXi0JQPVLC9JLM/e0yE1ZEgvPOx6LI+3kI98Ghd5wPW/JgHwdrrQ7j5s
	 6sLHzDdhkx0VHmjCxcN//4HOUeQxyYviHb63jIIhzlKrEGydedlmCut13zXehaIi8Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dtioWFTB;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0960A381B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC0960A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dtioWFTB
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso1133278a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186814; x=1795791614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHBcZQlUPQsO0ifHNy4xpiTb5H7JDbYhI3unlnSE//U=;
        b=dtioWFTBD1YkaoukvSZcYfvqEDVfya5uYuCMI2+ZCieitU7Z/N1+ODZcyscKUzydpd
         8VKZH+b4hC9sikgVEJQUg4PET/IvD2ongCBHovN1rQo5wG9+dvAE+bprivp3bcMXs9Ty
         8MW7/rgBJapUmTmb1vsjG+EviwSFdW7XP7ZqhOoV/0vDF4ZiRjlj6UqBKxAMAzLZMcj2
         N3vLa3/P+9zsPIsUjW/sM9xm+zu6Xqf3GBcUv3KS73PS7bEwGRyzHaPTFYklhkc6KdiL
         Cmx4j2YIcPlRxyO3rAYofOP2ogVEi1556SCGH4nFhE9V3n6feBvnCSH4X/jpeEnxC68g
         bleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186814; x=1795791614;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHBcZQlUPQsO0ifHNy4xpiTb5H7JDbYhI3unlnSE//U=;
        b=pZvQovGockpD1Ld4KqWqGkSY0u9/MvOMd8AeFVZl0JrikG1V5ACdwYSZmErk5cA0XZ
         o1qhqfeqCBEEC7bDhd9ZyfvGzjk44c9WfMlPHbe26xl6i0ZFPDQKC7wuBu5kKsNzgdNz
         KP9wc/txlx5Efnn2z7JOXzV6wjDT6ZviZrv7K1uDLdOh99mMpnEyuShFU5fvt9g6XcFV
         VIjT9RT8ZKrKY/JqlP8+zSZj0/IyqaFgVOkorgfj1DaepQ+2J+pU4kv0er/pPZkn2LzE
         k8NgcoGNtE4g6ndXF4y8p2v8HWx9RUjLNKz6+x1/hqdM0GWfR9xIhxyZiQ62nAUiY2/e
         3Lww==
X-Forwarded-Encrypted: i=1; AL+hErEwUsIJiU5XddtSwyEU0UowR99o9zX8kLF6mTXYeKIy47QuRN56ET1t8DMX1+Nz92tQpvRmqiz8tcEAY3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z896ncrhzWyDjA7kxONnXPoFueBAQelID2PSH6APRdLb00zFFt/
	Uo5rcf+NFnP5iyb+xSpp3UzB/oTEiRxbBXKFbxTiIuiMiuLdcSxyswku2xRQRIYsBgY=
X-Gm-Gg: AZFdTZdEj5P5qkY0cj/5zEimwiYQ9CRwcXLEqBdwklZhJefPUW3EmZnhqgkwxNTGLUe
	mLCvOL94KGhjryvzggD/NVxlnp83lWk5Y0qcpi1Ayxicn94xZPjWsthh7e7ch4dBxSvIfYCm/Yu
	CR6TN2J2zuysQaFiSkP7rPeeDwVt8s1SKed7z6sbT6nGFjKzTMK9yy84TBWi0WMu6mGwxfIg/hH
	yAv8/PD5EeBj1BE38+0BPkFHsq7mnD8Bct9g6A4YJshwCqKV1RLDnGYSQguix7YeQw9j9EbEwH8
	KiJUJT+Du00MnOolBYsV1LmG8jKV1wk32LMtT6VkX1qlzEMlkJlU7kGW7VMrB1SgycNNdGr/ryS
	9hRbhUvJKE7Wj04tp9BQA5kAWFmbvmDOsy8yqVreTsZDCfuC53/8HctvV72DKS+TpNWBYlFCW2b
	9OhRUXrz7beg/6XC0BNdcZxZXYZ71iUrsJjEX5CiRRHkRfr5ZplBdlzBOvWNOdDTi4fmlA4OZFI
	+j2obGzRiGeEMMcW0cWdbBMfD0j3VRfUqRB2++YFbXDvw33UugUL00xwzXh2Pkr8NzKdScnrjQ7
	MnuCGJdj4kayYZNtY9l90nRSK9o/ANTTC8l0M01Pt1uwq5CJSFz2cA5GHckVoJjYjSA4dJrDnU3
	VCtYabevpNYHapfbu0hZ4+l9crh+4aXzcQQHuzw==
X-Received: by 2002:a17:90b:4d87:b0:3b4:68e:1b77 with SMTP id 98e67ed59e1d1-3b40a5dda03mr3742019a91.20.1795186814085;
        Fri, 20 Nov 2026 07:00:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm1367360a12.21.2026.11.20.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:13 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Sat, 21 Nov 2026 00:00:04 +0900
Message-ID: <20261120150004.3128120-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014004226.3469868-1-yhlee@isslab.korea.ac.kr>
References: <20261014004226.3469868-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 09:42:25AM +0900, Yehyeong Lee wrote:
> mvumi_hs_process_page() takes max_io, the two command entry sizes and the
> list depth from the firmware handshake page.  The entry sizes are u8 fields
> used as shift counts, and 1 is an int, so a count of 29 or more makes the
> << 2 applied to the shift overflow an int; a count of 32 or more is
> undefined outright.  max_io is a u16, and the sizes derived from the shifts
> are multiplied by it in mvumi_init_data() to size three unsigned int

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
