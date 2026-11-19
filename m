Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093785;
	b=Ix4Z2FXFXp1emg2fzLLTY6L+ujswMsAaZxE6FE2TKiU1QDxhPItIzSKyhfqxJUFfGq9Y
	 6NBGw2jJW/LxJRncCStEDQrsiRGkIh9zPdk9wKdTGhY05qblUpAonLkfZFp0ijuAfG7Ms
	 w8aHR8XUNz+L9n0pVS7oLYZw/IDxolCUMf7i5sr6JpPIq5cYyD7wqhRTm1dc4+mqoL+5x
	 Uw3pbI3GptwWRS4L2rDGbIVi6PEtji3jrzd/u0HsGDnEpMMBNul1llZQRVhaBQCAVOS+x
	 qzUI2dfUT5noqv3icxy2vExquzeAZo/vHArTzNZd2lAUL4muj3W2TL+tDe0uMEtkJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PphJKGIIcVX/9w8g1yp+hTGjPMtalyYrGbwcnLjbZ+M=;
	b=VVGuDzdZaFrMOCwi+dbqJY96DhhNUtNJ2lJHBIz8QpJ65VWxYDeF3kwIcLNhExCK2+Pc
	 jBsPTriEk43AnXi60k4GvA+NR65zQtNH/pObU3XxBLoQcC+Rprrz8wEL0PYZAhuYHN4BI
	 F+305cTuPaRhiAUnijWnCXugc6F1ok+pK0PJRJ1TuYeLHZ7ecZxtyYJDzmjKC7JUjqf9e
	 LtkvitovJQzLXA/GbRRLfJIbpqN7ir00ILtTuUevvIJnCsjvRoMNk6unWwKFxzYQqewS7
	 jqJ0eXBCOx2/6EYVT7ssrcemR6k+nOuEduz3Tzrv5V8OekXt8X0mT+3XXuEg157QEUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKuAJ8Mi;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4AB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4AB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKuAJ8Mi
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-14345ae29c5so157911c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093784; x=1795698584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PphJKGIIcVX/9w8g1yp+hTGjPMtalyYrGbwcnLjbZ+M=;
        b=pKuAJ8Mie2v1p8u+1ywcLCvbdTSk8yAAwtsyIHeqHVZcq1zpm1UBcyKSb0UJJTLH5D
         86OXAe4ZK+nBm/YodpCZPpXFWpKPR82yCt3OM8COiJiipvttXFU4XoBHX3JavBTg4Jg4
         ThwncJdfV+ELFngBllpkOcjIqn1VE3UqTHT/tGPWmcgc2mGrw9Vksg1tnKHVpkpvSgrn
         23KzZxH2Odl3lzA4ojWICsVcgSvax//z6UOB9RxUOfqFTW9gOYCku+jqsR8v7u04StYE
         3PiVblfsOIGH4+2s8fn9IMmecbnN3B8HzxO4dy4MLDIiOmDRxWCnXAnzcYNM/Lz/XmeT
         LeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093784; x=1795698584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PphJKGIIcVX/9w8g1yp+hTGjPMtalyYrGbwcnLjbZ+M=;
        b=KtyFYSU9GYonnH5Zh/HvliBz3mWxqvbtkwxF8xvYWiXuleN4epOjmQyoHi4LhcK6yn
         fKDBPm8K0lenBk8TWqqHJspk5hP7JGJN08JhdKDQ7/mSu6FSHcVLTf/df3yXM91Seo6c
         vFaOxrTEf/nV3u0jweNcV/FzDptXj3foNUsgaUVUmKNx/7Rq3kcTnyrY9HeQynzG8oo2
         xQnYL/S/2sBG5/xSqdjQ2oYNecN335Ok35dtNjlTSGEqVSHb4NA3wy9Bagw5wJn7awkR
         73/GvSlA7YWhhtzMZPphmIBt/hyqL2l0kPY5qiz8CvAX3vr6p1x4Zd91v2kVQMITYntI
         zpaQ==
X-Forwarded-Encrypted: i=1; AL+hErHNpJIJcIh91gUVMguy195cffMidh23Do1AHqgD2ppK+6RAN3lParqDB4wFtoOl9Ibajq4R9N0obSdHjvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JJ0LU8be1lakFmh0vN0TfA92P3+MO8VDamGRzvRVz656OHyjf
	NDY2GuRxvouan49vlZgjt4QMMWVmROCj0LuQsXkvnsAOFWDQOnJKh6VX
X-Gm-Gg: AYBFou1354Y0tXf8bjiMakY3yDnuUChNqWHLOg/w41go/SXTNr1DZIkfe4NEA0BFS5F
	vmJt/ifLv9q5ez4f4AAxmql0NMIezVcdhB6piS4Ux4hgtYDwJnPyhq6Gnx8yt7aIdAsWqMxatZl
	LuT6VKc+nG/X5x18dsNH+AcVhJV4xfZZl9vgLTFGv4nl6LRjQVhfZfq0YAbjqy1buIiaHX4Z815
	9vo0mX7nWlZsXOA4psf54o59Qsj0IgULMG8csCTThyZBoMQk/ZjYhAKW+860pyRs0K87/pELYCL
	ddRRPgA5j/0smEoFazsauuli4Y6Xwn2Rv0czUMndZqOQjKG58ngMP6qcrBb2GUip3z4hmegE+fZ
	qN53Ez/FsrsTS4NZ9a10zYUM+Z/s/bu6pq+aaZtK9a8D+viUHO2t35mORMLdcr2RpdIaG5Kfjzf
	2dTxZSu5+NBaY4j5E4phDd2BN+5CyOCo3sSalbKUh8QruaVkkkm1cn+sasjqVA81kqYeY4AFQh1
	ykBY5259ys7iyECvNc6GKZsMZKwZfUMF02r10Y5ps/o2/9Rqd4XjHf2bXTJIwWE2F1iik31lReN
	Z0lHIy8f7o5daoBOrgh2zKmAFo+cMULuYxZgwFOvb5wC0vsmWwB7riwNZWY+yaSCb+EPE5HMGlK
	L5cbj4cT03FqA2NcN1BN3GTEn4aEqLSMltja0QA==
X-Received: by 2002:a05:7022:7f0c:b0:166:b307:5855 with SMTP id a92af1059eb24-1b543b316aemr7096471c88.0.1795093783741;
        Thu, 19 Nov 2026 05:09:43 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm19601165c88.5.2026.11.19.05.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:09:43 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] f2fs: reject immutable and append-only files in secure trim
Date: Thu, 19 Nov 2026 13:08:14 +0000
Message-ID: <20261119130814.79404-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

F2FS_IOC_SEC_TRIM_FILE only checks that the file is open for writing. It
does not look at the inode flags, so it discards or zeroes the blocks of
the file even if the file is append-only or immutable.

An append-only file can be opened for writing with O_APPEND, so a user
with write permission on such a file can erase the data that is already
there, which ftruncate() and fallocate() do not allow. For an immutable
file the same works through a file descriptor that was opened for
writing before the flag was set, although f2fs_write_checks() refuses
writes through it.

Return -EPERM if the file is immutable or append-only.

Fixes: 9af846486d78 ("f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl")
Cc: stable@kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e2c0f5083313..ba131c6f9a54 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4582,6 +4582,11 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		return ret;
 	inode_lock(inode);
 
+	if (IS_IMMUTABLE(inode) || IS_APPEND(inode)) {
+		ret = -EPERM;
+		goto err;
+	}
+
 	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
 			range.start >= inode->i_size) {
 		ret = -EINVAL;
-- 
2.43.0

