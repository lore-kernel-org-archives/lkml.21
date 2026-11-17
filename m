Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956915;
	b=JM4c+pIR8TUe/aye9UeD+9/YqvYbZt4XcsWmmUxHLaU1RMOOO0+/EtQDVH4uY38ds2zS
	 rx2645EDAxEAT5UGqFAbVDhpNpcmQLpy4oTz1+IB+2mRr1W3SBAW7zEnO4IVr6F037835
	 PcS3USSWWFhdM08aMVg/EP+yQH+zZnTHxlYB+TQA10jbbORtgkNpqLELKsTF2uk3jkAmS
	 higt9ijHLe0qK9fSDHt7afwznoFlv/PdWrFAV68qtmR5N216gifFrG5oJGTu+jVos/dyW
	 7mD3TIjb4tNH9911cLFZpKsq+exttloVfKu0j4UYCSdST0+nlRYwIDajBynhFpEKWvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BAFETjYWf1VFzL4l+fLb4qA1VxTBf2Ld8d6fUb/j8RA=;
	b=gqVNIJV4y8/PeWXJunhJU3E+xoWGlhCWGDeVweMFrlbWUdyDqTYEy0T5UdsG9gDFM2kf
	 P0PmzL2HzeEtIdQ82i813Rn1ycxOHzd9DWzAd5QMfWnNqZX7tgkjzx9B0Fyofv9cgGDg5
	 nWxckCPMldC+5cdx8EROdgQkJniTy2HR+Y+jjKguJrkYr28+frYHOOYz01U5IeWV6ClTZ
	 LGagpnraXg6CaesbGsuZkE3ysEZ3MdAm6SN2pbfOxBPuwLCB0jWCs59yuookelHLQ4wvB
	 vfL9mcAfM5UAymb4lWV8LZzP9VqH7r7t/SEsDMnejLKflI5U/wEyUkTG0i10+mv7ucA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="my/N7DPR";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DAD606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DAD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=my/N7DPR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4694085e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794956913; x=1795561713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAFETjYWf1VFzL4l+fLb4qA1VxTBf2Ld8d6fUb/j8RA=;
        b=my/N7DPRUmWh2NaKdSk7weEVnpTfHpgewqlC7azozwuyH6lkDswzvUvfHm2iqtQGGz
         85XR1ThKMhq9IaR9YC3U6N06rWOdq0ro8uCpGKZsHyFG8pQlSiKNIrfLF3oONmrkF99z
         FH6bHjqX+bwDkuNZD7EiEwuwBC6CVfKmAgeZ1pNgmbNHPCc+qzQc/22NFmG2JxhhQLiA
         XQHUVZPlTOEXjUjQld7N9S9hnbTlWdTrjEoW5IFlmqzMAnqSii2kfmYSPzbbnaw9G5SW
         xQwCtYjBuTIpczn4W1FXUaO+KD5Z/pc+reZA8yX5T49oirH0rjJGONvob+IheNsnQyET
         P8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956913; x=1795561713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAFETjYWf1VFzL4l+fLb4qA1VxTBf2Ld8d6fUb/j8RA=;
        b=IPc7KF5QvnK2rIjyCkl+DQuDUAIvjErXdBCaaE3M7piLmPyw38avOhnXGQ9b6+Ushg
         BZS66Hr1QvfpSAIQBr6/auCRse28vBnr0vVrXUhBLBmLLzXKxBuvoh3eje2if3/p2eJR
         Olcy+IQW4jhxITJvvln2SoHStplGKMXy5bgbGc6FXT0skn7dMgORPbHwNjXVa7dZY7ge
         f3uoxqEJrve8VVf6U/eTkIE3SSxOLs0JA8DY2DF8IP/DJgF6bsm1j4hdhAKA5Yq6d5Ia
         KFpxnsg8zI+N9dAHsB6w+9xP3meDFGtOaB5mOhGaplb2tgC6OdlLXi4e09mWawl0g0Rp
         WaGA==
X-Forwarded-Encrypted: i=1; AL+hErFTCTYXJK6Ou2S86tj5w3WhNjmWmnL41+q0waSrRRa/L6J12GyRpgWfFLK40HQp52NhNtHWjcDk/xBfmgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XAOWOBt4UsnfZousq6m83GoewmJlsbF4T13GTWwyES6g8BKa3
	AqIK47bCoBZA5pUpXQoetqkvdug8JFSNHFRqNG8UzRWHUDyjnP6+oTz4Dmon1w==
X-Gm-Gg: AYBFou3hF/IACuV78CBUBckpbRLB8vI4/HGbSutVfkaugGCfOXk4hWPZHb4UIKinhcq
	aMXlnrMy5TXozzEPNQGouIMe7ck3WYe2augJME8OYlgp9vQGTi2PCyJpHzgAbL8v5gPfLcDXmUf
	rLdmzYTFtOE7+LDnVWpZiGfozFn/jHP3OIHA3PNOLXScHLwT5EZAT3FteyzF/opk4Hyi/IcDY8Z
	679nYe3YW0YNZH/4xUb5TuFwB5wNEr0RDnLyzCQl+9t7hd6s8s8Upz3cd5Ud5hziO8LVHBj5e53
	chMU3YWXtzmMBJLxT9w4OoYcTGU9kj5EyBAt6NqC5LMyPGN00SBASlrNQCQb1eCEHiTE1NVN/q5
	Bt9zHw0kqPz6Dca2IF0XZ8wZwyulz35hZF1I46m9f6BOUHVCyBqQw0CrFz6mi2JjFM5rjSMkg+q
	LE1WUudGunzz4YqSar6QJNbin81MnsHnhqRDtNI9Pyh8iCTBBCaCiswCv/j09skzDmPAJT11rxZ
	Kq8+hb0NKoPMP96mKefuw/oJT92SBR9A4S0U4VpMsrPqABthALCu6Bau9fEAC6xtg9dhRabcIlw
	NN4mtQbFeoQhslMVqNo3copbYfF79T8f9hkLgBQouO9ViILWSH9TDqy4M09D+23gpuc7g+1Mod2
	HR1j8o+ySabtr9l4wHCaen4KnW5zVJjj4Pj8IUCMCvCYWS2cEnav01SjsOoBboU2hDaNeleVlab
	CrmDPhBv3PgItLOLvyVH97XuGV/QqvBEa30tqrcMvWsdljrBZF1l5DWKseFKFQJ1x6p+NmutVwy
	QvdBJg5bg+CzNRG
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr15204455e9.11.1794956913230;
        Tue, 17 Nov 2026 15:08:33 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-1756-489a-0fe0-4acc.rev.sfr.net. [2a02:8434:fda5:4201:1756:489a:fe0:4acc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e577acfsm1934435e9.1.2026.11.17.15.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:08:32 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Preserve arrays starting with an empty value
Date: Wed, 18 Nov 2026 00:07:57 +0100
Message-ID: <e40c6adf42ba4b90cd16d9ca955f38c6c4783eb1.1794956874.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

bootconfig -l treats an empty first value as a key without a value.
When the value is an array, this drops every subsequent entry from the
output. For example, 'key = "", "value"' is printed as 'key = ""'.
Reading the list output back loses the second entry.

Check for a child value node instead of checking the contents of the
first string. This lets xbc_show_value() print all the array entries
and keeps the existing output for keys without a value.

Add tests for direct arrays, appended values, nested keys, empty
scalars and keys without values. Exercise list output from both a
configuration file and a test initrd.

Fixes: e4f70b7badb4 ("tools/bootconfig: Add list option")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

Thanks again for reviewing the earlier bootconfig fixes.

I tested the list output on my Ubuntu machine using plain bootconfig
files and a temporary initrd image. The two new output comparisons fail
on the original tool and pass with this change. The full bootconfig
test suite also passes with the patch applied.

Thanks,
Eduardo

 tools/bootconfig/main.c             |  2 +-
 tools/bootconfig/test-bootconfig.sh | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index d3f840c5adce..b189ca0935b9 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -170,7 +170,7 @@ static void xbc_show_list(void)
 			break;
 		}
 		printf("%s = ", key);
-		if (!val || val[0] == '\0') {
+		if (!val || !xbc_node_get_child(leaf)) {
 			printf("\"\"\n");
 			continue;
 		}
diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index f584f7637e12..85d56b7e4ac7 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -156,6 +156,30 @@ $BOOTCONF $INITRD > $TEMPCONF
 cat $TEMPCONF
 xpass grep \'\"string\"\' $TEMPCONF
 
+echo "List output preserves arrays starting with an empty value"
+cat > $TEMPCONF << EOF
+flag
+empty = ""
+array = "", "value", ""
+append = ""
+append += "value"
+nested.array = "", "value"
+EOF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+cat > $TEMPCONF << EOF
+flag = ""
+empty = ""
+array = "", "value", ""
+append = "", "value"
+nested.array = "", "value"
+EOF
+xpass diff -u $TEMPCONF $OUTFILE
+
+echo "List output preserves empty array values in an initrd"
+xpass $BOOTCONF -a $TEMPCONF $INITRD
+$BOOTCONF -l $INITRD > $OUTFILE
+xpass diff -u $TEMPCONF $OUTFILE
+
 echo "Repeat same-key tree"
 cat > $TEMPCONF << EOF
 foo

base-commit: 381b391bfaa3f10d52da4740529804b0b6b8160d
-- 
2.53.0

