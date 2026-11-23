Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414711;
	b=eDiyu663rXaGn61v5hHwvntxKdqRFi63+WzO5VkqFUo3k8NgPdI/TNBfr1Cpeg3qV0K2
	 DgvG4a9s7L9+SVO05k5kmdKynVGk4x1iAv3bGv8Olznj8+ImKfy9pP+ZxpNY1Ul8eMqs0
	 57YBFI1MQqUONaogU8gvgEoc97OqA4J/tgpDP+Gs6QemAOTYJK1UL3sxdg2pdFRUXKtC9
	 xk0xLG5oVFQ6RjxW6qnZMpCJ7MJmkBnwhUzLqfLhLacrynkzjqeyzHDSwksIUMILFT4kX
	 J3qZFeQKMe30TvhXbpMx+nIPD2RoTXVaIo6DqbbpyL/A6LMl9GF1SwtUcdUEeer99Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=dLytYQ07FVJVySJIOlerRAcLdDVChLBLXXS4O66TYZs=;
	b=mpM9g0Do3esV+IoRpvA5ElQSbW5OlFK/W9PZrlvs2VqSW+3auqDCb1s29pu2Rgceu9KF
	 Fm8gAz4j5hswwjrB184deTJtT2irrlLs2rnOKrCZTy17JCg0i8fL6GSi/xscn6fy9ZT1+
	 OE9jYb6+EBqUTvi1P3GI90S7TdEgLnAr/kiHsbBuTGMq/mNBpBH8VTlQFm3futQ9RtaXj
	 8wuz54nkIrjyUqFfRIYvgoydrM+weJNwaSb19PnqMCPZ336ZZN5X4m40fV5Sp9t7SU+Yq
	 ujQSWgYa49QUBS2TLAQPh25fOmTMm3bD4APS+hdwiTRjAMB2+twl/XIBSCQf4IfnW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEAfsgvo;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C80606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEAfsgvo
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so436303b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795414710; x=1796019510; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dLytYQ07FVJVySJIOlerRAcLdDVChLBLXXS4O66TYZs=;
        b=FEAfsgvodyRhzP/vHapBg4sJcaEX4S3niiiCMjiNzeMaG0wKjv6kKg+pOyWz8lDh6j
         9A93s/4Mhg0e1nDlV3auIkYILrpcWTaluG8DGKZ3nrg7v4Ms/3uAt/pPTF4cTDQ5Z1u4
         s79exU2c8GhZnd8pP92AmcZn2/rMSz2294/8LlYqkD2MYndip9Cw+UMpBDO5a2U9mspR
         V3V1BmUT6ceAbBpLzd3SxPpgpBAKOtzKWT/vtUNno5MaGBdS33N/KFHq1b3n0MG/QQIi
         r4RRMQ1F+oNPKVNUvT5Jqgr1BFFJBcdvamZd/7CxnuCnghSf9YEBxhROgB9LShA1HVo+
         TerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414710; x=1796019510;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLytYQ07FVJVySJIOlerRAcLdDVChLBLXXS4O66TYZs=;
        b=WalUSFX9WzubmqMutdBDvSciTxPBLjQridNFGw7Lut69vO76ixRiOD8e6bof0Z82IS
         8zbq1YYPrr44Zkp72wOs8F0yxh6UXXmgoWJtc7bniwBmw5GLdeG4VN3lduas3pImVACw
         ekylybcy5FPH3OxjRH9jd/Mf/5/y0bvWMRcJLBvVGbKudCxYX0KgqiDNGT2Wx25iJlES
         38L5LI1RK56CJDuZbKGd8c04E3tsk3ds0e5QOqG02cZwRRyxe3WRhnI99WemNnTr5sqH
         MbvP+zVFiaF3pW8Oj98zMnbGFqEKM1EtoxoLYmNdJ5+bjvpnQ/Z3n7xypiFvm5DXcTTO
         asCw==
X-Forwarded-Encrypted: i=1; AL+hErFZ2yRjwToJxt9JAsoByWWOeNCKpFVun0lT0Nq5VOqCUxGwxBKYO4bOnqqH+OTUrY9YXT8XmJjcC6lBsf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zdJprqib/XG2khaeANbVhcGJh7+H+H8f+FHpzmzY+0wYL6f9L
	KtCgGabHKO+wEORO3CQ+GS52q0IruSBJgnqMgiFn7pVDpAszmkIVDIwv
X-Gm-Gg: AZFdTZfYMo2SZ5MaY3eFfEbYgVOejKmWPT8Au/DtBwhBwUfPX4JXOINAcLX+XBJmuAy
	QchZVTzu7L5/4zbufEL4ZnQ31AfL/57theldMd+B0GUYbX8K8EKuW+ExbmLrjEyYoJKczXqL1jY
	phcjb7gSapRxfJzNt6f1wd+UvH6WNLiDzBD4Dy2pbjg11eQPU1V1ev0YKA++RrPOkOlQF7ow00k
	edDxW4sl+FQYhWdjRAoI3UShLjZtgvqz5OaIHvc6V2j6mVKXfZpo2lS3aVPkkIJ7h5SYidpvCM1
	Y70bcWvdxcnjLlB8DZkdCWdsGemRJ8ugc07Cs9PRmPp2as7CEbvhYDIthXD87qLwIiOAiVx9Bt1
	1Ihoc0ADjfUdxu+3R1IdAXX0PjIWNWI6hIbGOlDqXRMdkVoQiTK6MsqVQkAudA0u1L+nvaLsDmH
	vjvp/s75oSjsMok8O5gqdx19BfkQO8ZAs7LsY6TZy5fD+DOelwj7DKH+vMLgCosiCEuitQ6Ay+o
	PWk6omERc+lpwlGfggC5NsXX6nbNJrSnbChHcs/vABYm1ZcGrGvlk6GSXj5rlbViVqOHsqkuAqs
	htBCb0d5SIQOXQ/b5CWct/LzeLSeZHmgnNH6mDuZz/zBRqL/
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr9586446a91.5.1795414709920;
        Sun, 22 Nov 2026 22:18:29 -0800 (PST)
Received: from [169.254.42.106] ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm20555357a91.8.2026.11.22.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:18:29 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: "Zhang, Lixu" <lixu.zhang@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: jikos@kernel.org, jic23@kernel.org, bentiss@kernel.org, heiko@sntech.de,
 lee@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 ayaanmirzabaig85@gmail.com,
 syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject:
 Re: [PATCH v2] HID: sensor-hub: Avoid holding spinlock across child iteration
Date: Mon, 23 Nov 2026 14:18:22 +0800
Message-ID: <179541470215.18860.14575261868309740807@gmail.com>
In-Reply-To: =?utf-8?q?=3CSJ0PR11MB561395B8C8BF1B839137926793452=40SJ0PR11MB?=
 =?utf-8?q?5613=2Enamprd11=2Eprod=2Eoutlook=2Ecom=3E?=
References: <1795161418.hid-sensor-hub@viennaoffh.gmail.com>
 <20261120135005.566-1-viennaoffh@gmail.com>
 <573f3eb75601c17d6e766fc47a7cce1bc2274998.camel@linux.intel.com> 
 =?utf-8?q?=3CSJ0PR11MB561395B8C8BF1B839137926793452=40SJ0PR11MB5613=2Enampr?=
 =?utf-8?q?d11=2Eprod=2Eoutlook=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I'll do that. It was only after your reminder that I noticed Srinivas's patch=
 had landed in git history just a few minutes after I sent out v2.

OK, there may have been some misunderstanding here. I developed my patch agai=
nst the baseline kernel without following the discussion around patches that =
hadn't yet been merged, so after sashiko reported the null pointer issue (htt=
ps://sashiko.dev/#/bug/linux-23655093-642a-447c-b416-776e47c98d55), I submitt=
ed the patch directly without giving it much thought. Only now do I see that =
Srinivas's earlier patch had actually already included the NULL-dereference g=
uard. It was all such a coincidence, and I got confused =E2=80=94 after all, =
I assumed the issue sashiko had just reported wouldn't already have an earlie=
r fix, and I also wonder why would that happened.

Anyway, I'll send out v3 though it may not make much sense. I apologize for a=
ll the trouble I've caused.

On Mon, Nov 23, 2026 at 10:39 AM Zhang, Lixu <lixu.zhang@intel.com> wrote:
> Hi Shuhao,
>
> Thanks for the patch. This v2 does not apply cleanly on top of
> hid/for-next due to commit 41cb3076a221 ("HID: sensor-hub: Remove
> clients before stopping hardware").
>
> Could you please rebase it on top of hid/for-next and resend as v3?
> I'd be happy to test v3 and provide a Tested-by tag.
>
> Thanks,
> Lixu
