Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795356686;
	b=nb9v/o1c75/GEBQ7AYx4nCfce8/O4HNWIVufYf3+EIi4rKimLkQmL1/Tj8bmfgnl/uLr
	 m1ZwPoUlUcDFnDCKApShH9KJxG79Cf2uIcTkrgqlcfF8R0B2b+NQxrvCX+14QHdjO42GD
	 0JVRFae+tH2819FqHustB9yqGFeaSZEeollvPvt5oaqKTq2AJDe9y7lDDyDalrApNkMTj
	 OVDWkVKmhdaAkP1mFKudFOus9KTemXd7zGzvfwrPZcFPLSWEVLDFDFspTdvjiO6V9NVNW
	 +4eQ3acADG8M3uvjs+N55xZNQFCSTIgpo65Iv38tIJHcb76ZUarzfGv5k+WVDEAIJ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BIj6cyIw7o0lExSO+WDhODX0VMmE4esj3iFVgOr+pe0=;
	b=NKF5Ox/ikWHzo3T+1QHSYe38KCzDT5IYCjG280bT+AU4kjRNR2Y8QCpI8MKD2R4uqp+j
	 651Cs2HwTOL1PLEX2XZTWWJLvDHtIpk//eR6Ao6aWoNds2aNEPogNHC4WqSn3rn4qqcvZ
	 quPfatUgfUJKhoNdYLkorESEim/U/aPgBQRhqARvEOHL3R+YlKyD1NbxbTCC58fJfaKty
	 jKyttg5FVnKqJtUZW3tiaJPj2bhOgXeOhRLtceOp6Zpng5W9drfTdOTQGCHikqpzLkpco
	 ryYz8EC5Is07gOqa4feXGywPTF0c5RN7AXBPX6iRxkgnlgvbbwId5C5aJfqG46vAZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jwGHOWZ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C340606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C340606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jwGHOWZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so22860655e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795356683; x=1795961483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIj6cyIw7o0lExSO+WDhODX0VMmE4esj3iFVgOr+pe0=;
        b=0jwGHOWZzEH0X56ysrOq2ZRHO+PYe11rMwhSGBf1pIASjoH+nSlcg8ZP444CZ9NwOn
         GyStv+ZRWbk1CJPl2sT85laMv45SqTG5H11tF3DQSDWLM+EYHhJL4NwhXuTQPe+H7pkP
         k3K4FibB9lpXKKLaO5B/5UufmGOLaO9ZbcegBYvmdTNJnyyRMVChxj5ECuma34nvAq9S
         3k7uNIMqmedlHHVFhHElk5Q00hlJN4YORg9XSaq/xb8UGRNlFr2/XAx/ULtxkS3QplkQ
         kFOj8cGIwmWg2ImknTZOqILS3GuX69YR+diaX365X6j35JUBAhEAzR6Z0947BIkY/QrM
         fXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795356683; x=1795961483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIj6cyIw7o0lExSO+WDhODX0VMmE4esj3iFVgOr+pe0=;
        b=e4JHP9YMeDJhdNlz232aFHYqp6395hyDz/cTFbHCuc8ZEEYylVPRKGByxUB4Q0cPks
         2QJwwt3R3GBHJOU/Ok+uTlEHSzkrZTefo/jW7HkW/JMd3x3GqA3Q2/8tLWkrdcvospSo
         VBv1BjxEqwwsmn82y/CMp6Do11O6wTYTngrktvay3/wZmqn9q8UGltOznQ+3afR/Hi55
         PTMqM4aO0IJlxTido6bhyfhDLB5IS7yilvxVeibKxeD2+3hQiSlZnkehKhjL8z460ohn
         yRT9ztvu9MP7DOyllXh570bAoL3H5EtitPbDusUX6R8E+X/alpn4RfT3ANZoda72l0cS
         J+ZQ==
X-Forwarded-Encrypted: i=1; AL+hErGraak97Pjy4dCisIIWTsbGyHPTaN0uWI8khUzk8GNc0XBEHT89bQ/xaXsBTlm9zA5ZZDNz/MQw1zPtl4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ay9j8xFXSv2cnv0yZLYT+vnhWZNqSLTf1w5jdGKWbQDDLqejK
	TSL98IYpoggygItjNJWFggTN+lQixlGWzjvLZPkAx6+J2A7Soo5p7RNW
X-Gm-Gg: AZFdTZePRSsV0IqGROln5WwUsdZqcL6paARZFGNxxFwYGTj3e47RizLM1WLpoOsbV1m
	VIe/O1fuP64hFbtwmS75MS/kOTABNQKqShs5zg1K8KumtmbcJKlRR7teno5bTATcyzHJqhlCLQA
	YevVVF3ciIwwcRfdt3ZIW1VPUx3tvcRhbOIn5JTlu9Kd55KFbpuS/QwgqayAV0YLYj/wcD5t7hI
	c9dR/QHHTFRPv1YqKQUGJ9wl6x986Adggm6mWOPzGAvnW1qC6Fjmlt7eQVlhP7a9my5n71NcZxz
	Bvod771uOUz7Eu2JxrJ2NSi+tcqv0PbUvxV5HxVybRsCdn/R2RIQNL1HEcOkN5yZbrCP8tJblrG
	XQtHmbh53FExjE4X3xP3Lscwrvyk86ViypLTzcFiBKXHhIb/GDyGVso5yGxno8EWJWoN04X+t2q
	R23+uafFqFJEkfNol8GJzJStETAFsiQX6+9iyxHIiASs+cvBvBpfRDQZ48ztR4NIffekcj6FQvs
	q3ukhWXvHMSsbctVQF3wYF0iTP2x+JrmevRLFJ770/AzMDavM45x8WtRX6UAGY0BD9eUxMBYUqQ
	7eKAPvvUYj0uWlUUMsJMB1hwO+5ucRcCZrqrEoigwxqQgiJ/6NGuyRTihvByrmpvGkqsZUhB6qt
	EOl6mUGb/FV70GReCuj68Kw9e7d5xX4W0RUdNXGCbt81gF0ptb/ql/67ISoqrq6UVQPod+tEZbY
	LVzxVIAuDcXXTkYFR4Fwvs3Y/7wzb4+RQ2ZKZPcSZvwqHVIcGO7KDwwlLZtWwOO1bjTl7gdnTSv
	i229hiUJlUyJIOW6y4yjGHezP8soc41ZfPXtos=
X-Received: by 2002:a05:600d:4:b0:4bb:8898:a591 with SMTP id 5b1f17b1804b1-4bb8898a596mr170586435e9.15.1795356683525;
        Sun, 22 Nov 2026 06:11:23 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm217481385e9.4.2026.11.22.06.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:11:23 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/bootconfig: Preserve arrays starting with an empty value
Date: Sun, 22 Nov 2026 15:11:14 +0100
Message-ID: <e716b73c17e214705729996a0aa3bc45035a1a01.1795356673.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <undine-1795312940919368991-3e5277c17e0a1400@undined.local>
References: <undine-1795312940919368991-3e5277c17e0a1400@undined.local>
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

Thanks for catching the test issue. The plain-file and initrd cases now
use the same original input and compare against a separate expected
output file. I reran the bootconfig test suite on my Ubuntu machine.

Thanks,
Eduardo

Changes in v2
- Keep the input file intact for the initrd case.
- Rebase onto the current bootconfig/fixes.

 tools/bootconfig/main.c             |  2 +-
 tools/bootconfig/test-bootconfig.sh | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index c32fb1e2140cf..256d2ba7523c8 100644
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
index a93a40d11d278..1f41ccd9ed3b2 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -14,10 +14,11 @@ ALIGN=4
 INITRD=`mktemp ${TESTDIR}/initrd-XXXX`
 TEMPCONF=`mktemp ${TESTDIR}/temp-XXXX.bconf`
 OUTFILE=`mktemp ${TESTDIR}/tempout-XXXX`
+EXPECTED=`mktemp ${TESTDIR}/expected-XXXX`
 NG=0
 
 cleanup() {
-  rm -f $INITRD $TEMPCONF $OUTFILE
+  rm -f $INITRD $TEMPCONF $OUTFILE $EXPECTED
   exit $NG
 }
 
@@ -169,6 +170,30 @@ $BOOTCONF $INITRD > $TEMPCONF
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
+cat > $EXPECTED << EOF
+flag = ""
+empty = ""
+array = "", "value", ""
+append = "", "value"
+nested.array = "", "value"
+EOF
+xpass diff -u $EXPECTED $OUTFILE
+
+echo "List output preserves empty array values in an initrd"
+xpass $BOOTCONF -a $TEMPCONF $INITRD
+$BOOTCONF -l $INITRD > $OUTFILE
+xpass diff -u $EXPECTED $OUTFILE
+
 echo "Repeat same-key tree"
 cat > $TEMPCONF << EOF
 foo

base-commit: 51934668ca98f1b23c51ce4edea3c61018da342c
-- 
2.53.0

