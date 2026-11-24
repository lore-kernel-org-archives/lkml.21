Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533995;
	b=yRoyS6bkUlCJxIgqTBO/8lNMj6LuG7HdpKqoUHUfa/6bfwzgngNyd/O6j1hbovyuVpLU
	 kKHVKJpLc9Zu/T8Sj6AWyTYmiNeOniz3LrXwHwaozQ3Lu22g3t7G7kQvzkZ3foZkz+uH5
	 z9eXsqSLPC5NwHuypKnfYM17m53aOTdcriJcEWaG5+l43k8o9+D+HV9MaAMSxa1oo2SR2
	 cvUZSkMJkT6MgzIEL9k/x9hu/zWtb5XUbIvVNI7eqBH1Yx2zhtsZVm88SZt3/Kd/NQevz
	 jQOx/UsW7wT7QWokeEIwrqoIViHx+p5oDCQ0mg1GdKieApkJuhPZMJ8mib7wcVkiNzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CP+oHDXP5r+VSZDonqBvg/vdjmvF/5ULzNobg5RIMMA=;
	b=fElrS8a4KDv0Mpk5BpkK+4+WWSfJ9L5wYLkx8/Ku6dBjcPd5l/NPjXkq10XdEalm2VMr
	 tYsHybA7ctHo/JhUsSbvpQ2epHnNSDsCQyyWxyG+LLnNA5oNuRivXk4SQDK4deWWRG31O
	 t1D/dij5O/UG6M7KTVVhdV7RVNsGp5diIqG2gHFh5i2Oa9OugL/FQ3UlP8ENtYOeapj+l
	 HKxXf/E9ws20Wzi1bELEevf3if9cBny8hdv/+JUOvx1cLNiuDEkVOa08ifEBL0VaGZ/Ba
	 +3TF9fd7snaVTZBUxbmdOKj4UPfqiO/ZIaYaJJZFjxb8RzuX1AmdFPI1W+g3Bh4FviA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KxUVjF7W;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCA606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BCA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KxUVjF7W
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5062bcb857so66907266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795533993; x=1796138793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CP+oHDXP5r+VSZDonqBvg/vdjmvF/5ULzNobg5RIMMA=;
        b=KxUVjF7WkIWRgryCeqCbBRofC50/0Wz9yoDq65QaB/kDEUAqclj+OvQBKqVLd7xn2q
         FoR8gOzvoEK3Ruf+u0UtZWQvaa+1G1JBv48gAtZdoEGlZy8GKwzKONt1aqBwmsIWQbn1
         ZKcTkWhQFBMkbogd0teiTSei+C1lghjMRm78evoVhCyNCcTw0yMpG+S8sMgCPsOmrFyW
         1VcmevniLqKZ/NOVXJr/HSqCUfXbxaJ32tGbGOfGA+m/4ROmaUAPqjzkBJHdZWUsd8pp
         /Q3cVLxy1WPuox5cZpR8CZWHUC8ZNtd+M6vjVTH68LmL/bKXju1J+3MHQiU2Ec9uiR0n
         qM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533993; x=1796138793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CP+oHDXP5r+VSZDonqBvg/vdjmvF/5ULzNobg5RIMMA=;
        b=2KByrBSrfkZFJunXOokTh2Spz88PDNi0CMVQhvW2azcTZRFT+FRHfPAHseKUe2cn1n
         3uL16Rd4Nmpl42DU1tQZNCPie0BHkOGcJSrY8M7AW9Z1TDCAnGvnPCWi3i6TTIsksrpn
         lVyYGMe2mhRFB6NWQ5mJjEeus2kqeRSmv7oc325INEIAA3Gt2RWOcmvcj8p8vzaEuArx
         XFX4zfmuuBb5s9mO8PquvOoC6VF66Z6xq91j6yXEUCOLkBM+4dtEpbx48fj5B1IBkHnk
         JfNlbnVymCFBfekGfsrunjNgNZ3NViez3mGL2GZ7IJATPcV1T4B3+jiKWtspaKMYNDDd
         W2pQ==
X-Forwarded-Encrypted: i=1; AL+hErFl01+oc2GUZkghzCgSkkZT32Tx3jLLWth8ySNlUcJGOGns+nR2yCjrvRUniEUegbxUn6upDdSyi5O7nsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9knjY6dSLAydeS0K1RRqia9KHKweY1hxQ+HxWlImAWD5CD/hMs
	wJp+SanaZ9D9VlwNOK1bj1XHXsiiofPmQCLvmSX1v8305pQP99TA0/MNj3hcXaZva2o=
X-Gm-Gg: AZFdTZcPRZ52hiqArwhYTezJHOLojGTozs6XopAUZ3pGf8qQSVbF9JcWYBzKLFy1koK
	jc7QRMW0ES3bkHC5uODg1kipqdW9KHIasqn5SBV9S/Duikj3gci3E+cE1bJ4Q7GTaRbQwji/IGt
	BsVWeUPg63cQ5VNSeKkLusIzBbqCG6iI9G4tTwrX/TbcDZXz8+E6ruTfNKX9x44f+qatdj54cmf
	Zk7dzv+xHRw72/iindpI+QrNlmVVTs6ZWdi/9SmpfwXZKaKzcDy1f1zs3s3IiKKr9UjE3kaqUjy
	s6QJc3KRfCwBRNv6gFnk+tYsVRB2r14wtzCpmeYNwiaD5lQWXFUXoQJg4Tk4r9JIQ1YZw1jVEvf
	kT+RNroztq+lFK1rBArZcJCja3I92azS4XzY2yqWxIhPyrsYjWVKgeqmw5OSaky2NsMAFsUXzqD
	NP1wVdBZvX4inRPwS8UTyLCG5C+ZtIzfPEiZ/pvsDvxv68IidczkCXX+1wnmhiRtRYOl5zFh24G
	2bwB9wPlpDQduXM+9zvKIlcRqRAp4G9872Xlt0iuK+t4xfAFykED6akqBR849NQJDCUvvomghft
	YnsP4RyxLZBLC6GmFMxQjE94YW79oAnNSCQxkqDTc2GFVe4RJKul8D86+JQ4iHml
X-Received: by 2002:a17:906:fcb7:b0:c50:d900:8536 with SMTP id a640c23a62f3a-c513a3a33dcmr1198571566b.1.1795533992782;
        Tue, 24 Nov 2026 07:26:32 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm7182425a12.25.2026.11.24.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:26:31 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v11 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Tue, 24 Nov 2026 23:26:18 +0800
Message-ID: <20261124152623.7838-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
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

This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
to iomap mode. It is based on commit aebb72744764 (v7.4-rc3), and
also incorporates Joseph's code and ideas from [1]:

V11 changelog:

patch 1/3: no change
patch 2/3: no change except add "reviewed-by" tag
patch 3/3:
- based on Joseph's review comments
  - modify ocfs2_lock_map_blocks() and ocfs2_dio_zero_eof()
- based on sashiko's review comments 
  - add TODO comments in ocfs2_should_use_dio()

--------------
# test report

This patch set has been tested on 7.4-rc3 kernel

## ltp

runltp -f dio -d /mnt/ocfs2/

results: passed

## xfstests

./check -g quick -T -b -s ocfs2 -e generic/081 \
-e generic/266 -e generic/272 -e generic/281 \
-e generic/338 -e generic/347 -e generic/361 \
-e generic/628 -e generic/629 -e generic/648 -e generic/650 

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/091 generic/094 generic/177
generic/211 generic/225 generic/263 generic/321 generic/322 generic/329
generic/331 generic/370 generic/376 generic/424 generic/448 generic/467
generic/477 generic/481 generic/498 generic/510 generic/512 generic/513
generic/534 generic/537 generic/552 generic/557 generic/563 generic/578
generic/588 generic/607 generic/620 generic/630 generic/755 generic/760
generic/771 generic/777 generic/779 generic/784
Failed 39 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 4K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/070 generic/091 generic/094
generic/177 generic/211 generic/225 generic/263 generic/321 generic/322
generic/329 generic/331 generic/370 generic/376 generic/424 generic/448
generic/467 generic/477 generic/481 generic/498 generic/510 generic/512
generic/513 generic/534 generic/537 generic/552 generic/557 generic/563
generic/578 generic/588 generic/607 generic/620 generic/630 generic/755
generic/760 generic/771 generic/777 generic/779 generic/784
Failed 40 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/075 generic/091 generic/094
generic/112 generic/177 generic/211 generic/225 generic/263 generic/321
generic/322 generic/329 generic/331 generic/370 generic/376 generic/424
generic/448 generic/467 generic/477 generic/481 generic/498 generic/510
generic/512 generic/513 generic/534 generic/537 generic/552 generic/557
generic/563 generic/564 generic/578 generic/588 generic/607 generic/620
generic/630 generic/755 generic/759 generic/760 generic/771 generic/777
generic/779 generic/784 ocfs2/001
Failed 44 of 632 tests

## fio

no test

------
[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29

[2]:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com

[3]:
v1 patch set:
https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
v2 patch set:
https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
v3 patch set:
https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/
v3 sashiko review:
https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com
v4 patch set:
https://lore.kernel.org/ocfs2-devel/20261103135605.22943-1-heming.zhao@suse.com/
v4 sashiko review:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com
v5 patch set:
https://lore.kernel.org/ocfs2-devel/20261105071930.16399-1-heming.zhao@suse.com/
v5 sashiko review:
https://sashiko.dev/#/patchset/20261105071930.16399-1-heming.zhao%40suse.com
v6 patch set:
https://lore.kernel.org/ocfs2-devel/20261115154013.9379-1-heming.zhao@suse.com/
v6 sashiko review:
https://sashiko.dev/#/patchset/20261115154013.9379-1-heming.zhao%40suse.com
v7 patch set:
https://lore.kernel.org/ocfs2-devel/20261118002050.9019-1-heming.zhao@suse.com/
v7 sashiko review:
- https://sashiko.dev/#/patchset/20261117150053.18417-1-heming.zhao%40suse.com
- https://sashiko.dev/#/patchset/20261118002050.9019-1-heming.zhao%40suse.com
v8 patch set:
https://lore.kernel.org/ocfs2-devel/20261119064029.11910-1-heming.zhao@suse.com/
v8 sashiko review:
https://sashiko.dev/#/patchset/20261119064029.11910-1-heming.zhao%40suse.com
v9 patch set:
https://lore.kernel.org/ocfs2-devel/20261120060014.12087-1-heming.zhao@suse.com/
v9 sashiko review:
https://sashiko.dev/#/patchset/20261120060014.12087-1-heming.zhao%40suse.com
v10 patch set:
https://lore.kernel.org/ocfs2-devel/20261124045501.10281-1-heming.zhao@suse.com/
v10 sashiko review:
https://sashiko.dev/#/patchset/20261124045501.10281-1-heming.zhao%40suse.com

-----------------------

Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig      |    2 +-
 fs/ocfs2/aops.c       | 1705 ++++++++++++++++++++++++++++++++---------
 fs/ocfs2/aops.h       |   43 +-
 fs/ocfs2/extent_map.c |   34 +-
 fs/ocfs2/extent_map.h |    3 +
 fs/ocfs2/file.c       |  345 ++++++++-
 fs/ocfs2/inode.h      |    9 +
 fs/ocfs2/mmap.c       |    2 +-
 fs/ocfs2/ocfs2.h      |   25 +-
 fs/ocfs2/super.c      |    3 +
 10 files changed, 1741 insertions(+), 430 deletions(-)

-- 
2.55.0

