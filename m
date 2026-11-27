Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745352;
	b=ZALOYkdemEUL+dDxjnjO/yrOrDLflgctjJsFYdBBhADF5RvZhcz4OplcWK7Iyj74NakZ
	 dYnBXqhjlR3iLO4ehvODBTFigmk43O+gZ6pJOJGOCohowna3GrzqwptD3YuAp3HO49KKK
	 U2QM0D6Fwjc8j2iEpt8eFrubty0VrIf65xxU3mAC7175ziDdj4S3LqEnWD4hRxbWUUf/O
	 TTYFa4X2HxAxiK4ipty6rFziQg3IEkEvZ8+F5o0jWP7Ykbwm2MNumsKKhoBJzIIUQJXDA
	 wJRDmj5DY+f7B+d+sxui3so3/Qf0/2N9Ned237dyjz52MgahoqKfE9JIGaCAKRjCviA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TeoLwB/UDQ9Aq2ltKnBve8A7vn7QHHpVQfatBUUUiHM=;
	b=qtmkATNc3cyUEfcGgsad2TAiVFvw8ZUqWHY2a5J6ZFxeOZbA1GSr9cU2RPsWCBlPR4Bx
	 ZJS09CfRocp6FKunFjGrFEj/w/kteSkj7le92Azfb7512KoqHyV/Uma8fT5yzF3Cqo5yJ
	 zdJcpXvAs+FwJ7C55LP66hvErrBmXwT6aN7uuWmPilKAoFSzphSOQaSXBMUVT9G4/+ke0
	 4PugNTbctRyPsbXioQzrBaPDnl8rzmWFArjf2selzUDu5/DnJLCpBJe9xzii3yw3Nngyc
	 uTilbn/fO6G9pLyVZhRHXxwjbIIjvHKLSNA8o2EBLau0lPu2wxbJ3cvWT9giltE292w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNC4Ut4d;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D7A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNC4Ut4d
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso76526095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745351; x=1796350151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeoLwB/UDQ9Aq2ltKnBve8A7vn7QHHpVQfatBUUUiHM=;
        b=RNC4Ut4dDjREk+tF0RF4bt027lPbbbviyWu8pyVI6heo0h3M9zRAXClBQ1jFW+UFlN
         8b9YQvW6JtgYVkXQlYAr5gUS2zksACIBXb2DBk7sF3vaXnJynduqAatmZ6VTUNaiUYpT
         pjRrbU+F4Zdf+LHRYxN+6fodFCSjC0dk7DZ4V/2NRBTFtuhVgcSqzgWnjt9bD2TMQyKU
         7y+GbHBaW9wTnuXe3tO607XzJtIxD+0KSshxl/vMAL20/KZxN312/u6HNF+66prlRtl5
         uilvkn5im6BWkhxVCptHOW4zTeiEWvdZeQM0LawBuTzpR8Pl2gJiU7fqIEGwdMRwpNui
         dc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745351; x=1796350151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TeoLwB/UDQ9Aq2ltKnBve8A7vn7QHHpVQfatBUUUiHM=;
        b=HjFNVMSFhxIjcjOBNou1CGORGpuHbKooQ2c+o62aREbEdcn1jKKdrQAP8WFnf23M8S
         jd/i6Zq6THs/IKnTPmZ0RR5gKI3zoY/eDbgU2LZ70+zr5kYQfQ0T8CKCV4jLDGRY9615
         tp46AeSSyw4Fa+33C2shpiM7N14zagHryycnTGC7tIy9b14AEuwPl8sZjWkcjMQBatIi
         dmLnMX5ve15YuzA5jkTHHReOn247nbjJSRw3S+zl3Rf1gFiTb0NmVin88gZHxwbx4RT2
         GNzBb5HPp79s1cLLmXIMPbaNaOaERPu0Xz9vCV8/aM8Wi8zMwiBNXACuyjFwbkT3dLjv
         voOA==
X-Forwarded-Encrypted: i=1; AL+hErHor5Uj0r9Yvs3xuMD7bsKaLz80lGCpPOA5qv/XnSakmyRjN+PvnLPTfkYY46KXJR+YBjxYnbxvhLyj47o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VYIxc7dbFcc0vH8eTJFTVgBldp31Fqjb1qdhR2ir8uzyMlvyE
	HfRoyw6daBy/LGPIc/ei009DQsHA98jVOFz+Sqbh/1N2jhCp+7WKvzo6
X-Gm-Gg: AZFdTZcBtQ2mSMsfiH4CpavdpTHPXyztSz/vfmqAmVN4KCdU3E/Nk5beJ15BbYIeTyB
	cb1OUMSxbrB+zsD3LF4spUlS01C9HQhEqhdqhFGyPLGDcqcXP2jk/CUhfsgMlS2JUZCzY3JIUT9
	1zSqf2VUKoI6+N6TM9thgJNZWxTWBBJ0rJt1i3UgcP2dwFSV8nVcm655/EVP8g1aAKjel9lRaHp
	Yr+ywqFz5XfFr2Ru3qtAYAu62BBGCrUVn1jxaJLBVNx56PvkTSfoF/fSqMiqXHpzECPrLsZdj7n
	bOtt/cx9CJl9drOs5qv0JWEH6gKhCW1Xju28B419VjR9S5l3WRCTpc3l7mrYB/Gk6XrzZM8R+Iq
	e0cH7tY8/PRxFCYpQ/MjEAfpGNye2EhNiVX2/Bqi3d63uhWso6mq0VHW8pH2aY7bCBrE9EOWBvc
	LmcAEpY9FAmgkzo/rz2IEPgyuAgtoo0Gmm50aiOl2BL7mexO/69A3xXM1XclxKNAGVugEKudiH2
	Fmv8H05I2FTkPVqrEiJCe2M73+x+zwwSPxwU8SrAF/tupj7kuE0vxtvINhEsqggkleoc2Qb3oWr
	DNHR27HvRdJ52OYG4JqPMm2Lpg==
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr469097755e9.22.1795745350705;
        Thu, 26 Nov 2026 18:09:10 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a680355sm36421131f8f.27.2026.11.26.18.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 18:09:10 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: josef@toxicpanda.com
Cc: James.Bottomley@HansenPartnership.com,
	andrew@amutable.com,
	brauner@kernel.org,
	jbingham@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergeh@kernel.org,
	taherafahimi@linux.microsoft.com
Subject: Re: [PATCH RFC v3 24/90] cells: add the cell object and cell_create()
Date: Fri, 27 Nov 2026 05:09:01 +0300
Message-ID: <20261127020901.3649055-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-cells-v3-24-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-24-bc9095937a84@toxicpanda.com>
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

Josef Bacik <josef@toxicpanda.com>:
> +	char			hostname[__NEW_UTS_LEN + 1];

Okay, so "hostname" is present in cell struct, and I don't like this.

As well as I understand, this field is only used during configuration phase.
When cell actually running, hostname is present in both struct cell and
in actual UTS namespace. This confuses both people and LLMs, and invites
for bugs.

It is possible there are other fields in cell struct with similar properties.

So, I think we should do something similar to what we do in fsopen/fsmount:
separate configuration context and actual cell. At least in kernel.
And possibly even in UAPI. At very least, please, fill "hostname" with zeroes
when cell is actually created.

It is possible that what I said applies to other fields in "Slots." section,
too.

I already said previously that "root" field can be recalculated-as-needed
using topmost_overmount. Also I already said that "exit_status" should
be delivered using usual "waitid" mechanism.

So, it is quite possible that whole cell struct is not needed at all, and
we should replace it with some kind of configuration context, and when
cell actually starts, then that configuration context should be deleted
and replaced by usual struct user_namespace.

-- 
Askar Safin
