Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937094;
	b=T6MWTDWaaJEgz14ush4hF+/lkEJBxzIA+aytB935OuEYibTudM1Hcd0GJ+/ZV0VdZBO1
	 Gdwzy2P7US6PE2iX9Tt1Nv7b5lCq7ISWTtN5Sbfhzy+/ctMkR+LJJ/d6kuztMk7JaXx89
	 q/aCYmbEIAHmXUMLkGCMB01fiZGEK3bWxqHi1CkOGaLzsMdUimaUBeFx2HFj5oB7ts+eX
	 OR8s/d2rh3lxj676hW/yq06/VEm7F0c1Dp19j2MYUJUq6vM6vOGaq6nijsAUtOA4jAFDq
	 kOxSUeT4slqATyZIxbKXQhhrq6kodKqWu6YN9NUGM7C0WEAZXkledICdP4EncRA+gzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tdQG22gijaLhaWplOE+b6jkzR3mh5Eg+zc+PAvXuPiQ=;
	b=2drdQrAK8ZrbU2gqJneyG5Q00ogHkqsX+1l/BXz+japh+lhIJWnqDHZ39K2YBxJyIj/W
	 p2Dz/MLndaDok317hP4M3lRI+o9GS/QjqmSd7j77dXSGaY/UmY0+O7Pzt6NcqI7nOAPU+
	 729ttQs1YdBgtI8Jn+urqK8qCABkh3aZEVEgHWfjokyfPD655Bc/Ovu7o8HGrIvfrHQuB
	 vBW+mSrVEo8LtsA5nd/+VilevyNQ8fzZMIxH4u7cPZBQ1dbZXW5hOUG80kkmQNDxTYYJL
	 pzzSFvaG15i+vvkSSWXKHAoGB3FMcajuXfM+I0OEKFgwSBU2EtA2q1Xj8DsI17mS3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVAqYSFW;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVAqYSFW
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso10951c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937093; x=1795541893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tdQG22gijaLhaWplOE+b6jkzR3mh5Eg+zc+PAvXuPiQ=;
        b=rVAqYSFW0iRkDEC02acam7zHmYZDykgtzCylaOB9NXkQbxOWa/zEPnQI3ERdex1XwO
         rJ0RWwaDv5asvvWLVRSwABIKOsVa8zd4Vi+NGYlKKkBTVlzk2XOtb+G1bQZOViCvSQUR
         cprne6uAOod/IGW6Ydk/5PAyP3/Qicvx8mP3kkjSUH9q711q5PCJU7cSpni1/lgwqgSZ
         mhitF+KUQ5v4QET77sp1+KrIkn/F5bk5AgqpQXoQSZXm/8xYVHPgA02IjXLhAMVeFj64
         8Jk6/nk7a8SByHZilOZC2SRlQUhDYPKmRGy4yfjQuyVlIiZv6lEuhzBzePN/pNAnhbJB
         DPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937093; x=1795541893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQG22gijaLhaWplOE+b6jkzR3mh5Eg+zc+PAvXuPiQ=;
        b=EReROq80gkpXLQdwVSxutYKZCmqd2EQm/kYlvVqLxBfl+bB7tUOKxq+VFP0ISWbwSf
         B2eNAvVmRFZ2J4qv2uTd793q8aAGxKKlMK3aZ4/DbmiUT/bVIZ6syECSJFB7UoADZo2Y
         1USozwzIrGL3IFfa+7K13/yPBjthb71qTnOKopYJvhkKpgSFkzPBYDzgSlk1jAteEBxF
         +zrweB+m6VwtNpr+3de2sKetV09/EDmUXcwY2XlNz0kgYPDf5kyvkd30RvhteruTtLpd
         y8hZM0l/51JQPP4W0VLnp4+7TOQAXJmUN9bBfiXJfBeBjuw11SQEzH/s30bJeFeRsHfT
         mPRA==
X-Forwarded-Encrypted: i=1; AL+hErE0G4pNvLQ3PKFGWORzOJD9YluZeybg1qfAXVr5XJn6Unm7yD+9MZyT7ri1pr1TB3UrDuSnwzT30nCuOZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/26r7uGOHUy8zBndw8I8ryxeQ1JjYSvt8Ikn2Ls5iKerG3ByR8
	3UjmrQXhpSL1RaGlZ9/dgPCH5pYPXsnCS37703HkPpbY4RPBe/0uZPaw
X-Gm-Gg: AYBFou0ekUfkxFlsczr9WUCCbSD1T7CEuhfA3MTkDDGzRQdG7T0j8Kd86T87o2IPHMV
	r8k4E4U8P0OGxM4XE1/5o2fyikTHE7mD6l48KBmlAYPpNjqG9DlNKzRtM8pr+DULHfctYS+MRmY
	WP7Pa+0wWuSZks6O1mtFuf0zLOW3NJFFPrMZj7MXizJZmAvqHCbs7zxqtHMcmn4ch70/Htsdo5i
	YeAswcoKeF3wtBmMvZEvJqDDCfpLQiLQD46ZVipn9Ie0jN/2wQY1iC9YwdW9RxZKEuFi3qxbcQ+
	LVYqDyT5/y+T46GYCLRtstc3+4Xmz0pj3tZLLMGOufFE/q4XoiPUkTT0bwkxfCaPkSuh2ioeKAc
	TdyD0uNcz4d3a/RpYO9f7vvVJeklwE2aBvguRRyhfG/19gjZyEVdBW0knSzH3WKXraJ6Br14luW
	FYhYhl8xQy6rg3pa9xiThH+WUvrDOv4k+1fv1KkhwTqQXi36G9jHE07W3W9fc/w1YkxCQ82b3po
	T5RIcre4rTG5DJjrLefnZlFOnh+tXbRIC7G/27ERtIQrFVZ3iZutFOfRgI9AaZo1MfAFhGZ/273
	rsh9VdTBJYoJogO8a+Do5J/hllJfV+naNr9BQxYWlhIrMMXg8eJyr0Ska5V8nlFhunoL/7wvAw8
	VqYYJJg6mU9EMvvTMB7vshq5J8wJVZj9h/nFPMg==
X-Received: by 2002:a05:7022:1702:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b543cc6913mr216962c88.11.1794937093151;
        Tue, 17 Nov 2026 09:38:13 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm43523768c88.11.2026.11.17.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:38:12 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] f2fs: reject immutable and append-only files in move range
Date: Tue, 17 Nov 2026 17:37:57 +0000
Message-ID: <20261117173757.15066-1-dennylin0707@gmail.com>
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

F2FS_IOC_MOVE_RANGE only checks that both files are open for writing. It
does not look at the inode flags, so it replaces blocks of the
destination file and punches blocks out of the source file even if the
file is append-only or immutable.

An append-only file can be opened for writing with O_APPEND, so a user
with write permission on such a file can overwrite or remove the data
that is already there, which ftruncate() and fallocate() do not allow.
For an immutable file the same works through a file descriptor that was
opened for writing before the flag was set, although f2fs_write_checks()
refuses writes through it.

Return -EPERM if either file is immutable or append-only.

Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
Cc: stable@kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e2c0f5083313..9cf733954522 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3265,6 +3265,12 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out;
 	}
 
+	if (IS_IMMUTABLE(src) || IS_APPEND(src) ||
+		IS_IMMUTABLE(dst) || IS_APPEND(dst)) {
+		ret = -EPERM;
+		goto out_unlock;
+	}
+
 	if (f2fs_compressed_file(src) || f2fs_compressed_file(dst) ||
 		f2fs_is_pinned_file(src) || f2fs_is_pinned_file(dst)) {
 		ret = -EOPNOTSUPP;
-- 
2.43.0

