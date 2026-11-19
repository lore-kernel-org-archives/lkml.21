Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085610;
	b=XE6UXbvv6FFPqSR6UHRRXseFuurvo6gibl6b/z5coVGaXW7Kefvvo9ohotIWcAARzF1W
	 t9cn3KiQr3VJEM6U0nDeu+quvUqZCbqD5bZRfA+hO247qVbLYFkEWaXHWYylI9QXu+U81
	 T/4aWgSOmFmg4gYofCWL6pZVReWVlpJAqbrOndKFIR7bX0lSW1VX4K+CA0cQAQiPqcOnd
	 DQIfyNJxrKbE5AbBNXMQsw2fT1JL2J/hDVtOsMdwGL2OZcN1QPEqiXRU1BGT7zcRin060
	 uaDtY+Btf0ByJUk6aZBsx+Pejs6c/J2UMTnI7SsSGYYIXWQzsOcpQw8z9i8lWQk+dew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hqE0DnzQVOaqly9+hSqhRUU82CqCbvfu1P534JABEUc=;
	b=wzYwYkLVVunDbC1/oS1cWTDnqzg9r1ZBu4ZSKM41ITSas1GlxlK2cEvb7ds/OewnfJ27
	 DCu9Zs2yhO2Y9Rdd/JN3MSHp1Pbcj8nMfQzgQvDW8aVwEW0uWhraijNBL3ERBRVu1uArq
	 TmYKPtEmNM5R6/2Sl/VxpKGnz/8r+Z/Vmh9v/MQTZwPFXgU+tQ1zC0mdW3QwzFdbCI5N6
	 KZo+asMepMp++0eDnYCQW3m/sh109qvjFjT5nku3usnPvoIb0RJn/9RB5rzdjYXTx7t4H
	 l6/pIgAGZsU/1vVl/0DLYg+e+q+lGJOhrmzW2UfzHi/QlmsordqH/tDL2VS4/Lp6qRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8216606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8216606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1193858a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795085599; x=1795690399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqE0DnzQVOaqly9+hSqhRUU82CqCbvfu1P534JABEUc=;
        b=bZwgAt4TKqTsP1xWCq97VLu+tnoq+LiOuNQD/HqwsLAazfa4JIr0ZvR8So4m6B/gc8
         pyCh66xfyXhzvlqFYjormqzWR+xuCQVe5MHETbIk2+IAknavrZFAb2HuDzIV9YY4uD5E
         eXCmuqHHuQpKGj2dAUDbsHhu4JTv3sobzZRQx7SvCJ6c78zIEKZqkmT8TurIob+jPDQO
         l+Y2Byvtvx3HnX8UX9g2bVr18Tf/VnViCYbE/yj4usckpA3RAVus5ErQNhSmiI0lTFzF
         M/tA9ZH8Y2QwAcbDD8ncuGc3O2eCmFLrk6xcrK7An2VBmdR9dQSCi0QC0DsILEWkhtUh
         cFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085599; x=1795690399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqE0DnzQVOaqly9+hSqhRUU82CqCbvfu1P534JABEUc=;
        b=nKXdxFLkm8Q88wLs3b/W+W+L7QYbWTbiK4NC/0rkjAEKZFH0vL2IcLuq6FnD4zuVeo
         ObhzFHvcDNQ3YC/o7xwwRh9ZkncRELo4yjjA0RFajBMXLRuzgDmfe9UON3mkjiVSOqSO
         l4/Ul1R9hiU91HZKOO6IDe6XEoJacfbPVNGfMdUHyC4EiTn5xlaaiFFxsoKzsJTEgcUD
         yk6z5pa89mDGNKj3MkqDm78kJ8pZjbNArBvl9iDWpxeav3UHc5/7IYlkL0+wWY9Z5W1g
         tpIqczdmNDtwBz5IOsCOzSw660vlNMtFDRUaTT3GHqB8tP8ivPiCJEHspE/7UyiGYQw1
         42JA==
X-Forwarded-Encrypted: i=1; AL+hErGzsFnfIHwF36kX+wZTHVGl/YM3tfXkG13FTNUvL9Ffu5oYdBy9CrEQBol4gtdL9hBqeOT+qcvfROdOlLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P0Zc1IGmwUR0+bj4pGPye26YPV+ov4Xr+oO6M55tfKzdgJWOs
	soBFlvcxIpkbuWDRCRUg7IcVANysKmfa0KfAL2zx659hvVwLIQXiII1gIKNJy9IZmDo=
X-Gm-Gg: AZFdTZe2UWN2URu5o9wcovDTGb/KqiHHhSl5g8bFKWAUffLkMyf1CoUw7ostGUXttXN
	omCmDS1+L0d7yRXPdXaW6bUA4JSJw8AJor+arUFmjBTMo2NTg1Ou6ber4/ml5MfRTv9a4Dx7/Tv
	oQ1Um+LzEqKPwqqt/7xfapAGARNpnvgd5EebYlLl34ZXzc2m1j1EN9AgSK6JhQjHVERZ5hCBBIw
	wgkF+8t/F3jZ/hW3Cr8xHXZ70DusJwfk340mbRHARdubDPODhooisCnvVVybT8iRikngAfftVr+
	IAorv6cTVpP4s86LDx/I4GvlqY9d3uARZ4vzd5Fl0XNgTxapL4P/gE3yYd8bsDKMqnzxJMVOFG0
	FVNyRN+hIeeYbTaf9J24mLn+M3cbOOdBx30hdmHQu0iY4ZbYZ8pZNsHBHa4v4v8EBbpNEp7QMFP
	tt+Jxigrx5q4MSEh55XNIOZKqNHxV8c/cVZgErS1eTHMrI/aeqPOpSJ6qihrFR9qscbtKXA7spR
	iRNn0c4JO6fwxiL6t0bJDn91a5oh3Hf/pqKsQwWnFUSWRGk2OiLjkUEAj9YSfaTHpZEt4hg707G
	rGTvsEeKutadaNd2+rhDphi7xHGiJCaHk+ZSbRRGliDZ2/oKDE2W0aVBvwaFlWungwthkldHE7B
	HJdAXAAPCJT9Do2yI7uMrEqZP4DkN661pZeNPQA==
X-Received: by 2002:a17:90b:3d8f:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b3d07c687emr4819843a91.40.1795085598784;
        Thu, 19 Nov 2026 02:53:18 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm2246604a91.10.2026.11.19.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:53:18 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	guangguan.wang@linux.alibaba.com,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7 3/3] net/smc: carry oversized SMC-Rv2 LLC messages in the queue entry
Date: Thu, 19 Nov 2026 19:53:07 +0900
Message-ID: <20261119105308.2567241-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820023346.BF2B71F00A3A@smtp.kernel.org>
References: <20260819023306.644849-1-yhlee@isslab.korea.ac.kr> <20260819023306.644849-4-yhlee@isslab.korea.ac.kr> <20260820023346.BF2B71F00A3A@smtp.kernel.org>
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

The byte order point is right, and it is not something this series
changed.  num_rkeys in struct smc_llc_msg_add_link_v2_ext is a plain u16:
smc_llc_fill_ext_v2() stores lgr->conns_num into it and
smc_llc_save_add_link_rkeys() reads it back, both in host order, while
the rt[] entries next to it are __be32 and __be64.  Between a big-endian
and a little-endian host a count N below 256 arrives as N * 256, and
min_t(u8, ...) turns that into 0, so no rkeys are saved for the new link.

I have not sent a fix because the right one depends on what the SMC-Rv2
format defines.  If the field is big-endian on the wire, htons() and
ntohs() leave s390 as it is but change the bytes an x86 host sends, so a
patched x86 host and an unpatched one would stop agreeing.  Could one of
you confirm the wire format, and whether that compatibility cost is
acceptable?  I can send the patch for net-next once that is settled.

Best regards,
Yehyeong Lee
