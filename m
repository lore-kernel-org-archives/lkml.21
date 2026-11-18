Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009232;
	b=RA6wSkJ22eCDPKDKeHkGo2QLolxVSk2dhVA7T17sVcToKaFdUp1YZKAIF9+OtDMSpOLh
	 QMKxJ3pJub3EUBHHpMNLpOHn50femigKEjEwBuPcLrgneaqPhDjNf+oH2bUHqXLEma7X7
	 3Z3EMXahrxmIq7czFBqZjmZxldH2ewDELKTKIyjtA48U4/8doXkV4uAdGrtazlHbBZ5ig
	 p7uj+7XwFXtulQ9f8ahBimMgvU2BIJ8h5wYcoY0aP91eDGPvzN+K59eiGaCBtP36YaBdJ
	 km4JngY4eY0c4BqznlOT+UOxg0vsFyhdPsz9+bUM9JyOURcN/eYrf+Re9X8XHfULlww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009232;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=irZFbr+Hxu9lz1XfLLWYXCmNCuiM34S1Rz7/ClEOcAI=;
	b=c1XDzjIDRsHLeU1d1IBV3NCuNBV2xeIN0IwvOfvELLXw6V8PnhdvRtOQ7KcLzAwPZEj9
	 ODiXnRgkZXAui5t7NcbrCwLAE+j1Rc9T1rYOSxsBVYdycIAUhGxaBSGR6EVt0y46uD78T
	 Xa/LDqmfPxTVr6Kw3ii5KlhgBFF/AVkbJ9d8hkC/JpRAaZtoKxNMWxgLbdSj67ccMQWmP
	 1WSQzYRKckn4RUZkgraaEedvKGlJ6BDipW8ais2PWOA4nmzYh5ujrYzCdcmKTb4G/yTXl
	 /t7Enf595gxpKs/FWv6/MvXNmd9dshuxe4gMKt4yY+E3rqGWRLynBq6Y7Prw9zyTzjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=uCDwkHoP;
	arc=none smtp.remote-ip=195.121.94.184
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CCB606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CCB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=uCDwkHoP
X-KPN-MessageId: 9ae22252-e355-11f1-a4fb-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9ae22252-e355-11f1-a4fb-005056994fde;
	Wed, 18 Nov 2026 14:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=irZFbr+Hxu9lz1XfLLWYXCmNCuiM34S1Rz7/ClEOcAI=;
	b=uCDwkHoP8yljCXPLCQvUgiR1SV3YN8mHxK5fHVcNUkgwDb1uG/7HyhUPHQOKFfYYgbXXdAq7mjGQI
	 UJ2IEnXl6a+0j365muvG/lcDPt1LkkFUzrn1VuogLvy9YqfBm8fLjbD5XPMQFjBTnITih1Fzeb4Fb2
	 dMH0zlRSeBpD+R/bEWqUH/YxlGnm5oFyGUIhbN6hmFSXsqCk9UBBZH0Vlqxh1qlLZ7hwf17wfwsBMC
	 Q5iyovM5pQdwCyjOvGwwJE/sbAwM+MoiJ1P0m6PR9gXus/5LIiiKnfjf5NDLRhMFEtt0WkK16XqxRh
	 70C033HSyiKCDjEWS+dNiR/huTR2/lg==
X-KPN-MID: 33|LTEWCgxrmF4Fd8IqjKc2u4jc5xcOJSIvfDZ4hRwoKRLko/hv1bD/LSyEi4hF5Gd
 5rwaiZeaIO804KWJjFil4ZA==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|iUs0CxhQER9pzgr5bDic8V6KX4xSfV+lLsnAyVcVbBt2KOg7tWeU0AqJ4p26kzY
 lDf/uF2E6MyfvLyQ91hl0sQ==
Received: from [192.168.122.1] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 9acb3515-e355-11f1-a6ee-00505699772e;
	Wed, 18 Nov 2026 14:40:23 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Wed, 18 Nov 2026 08:40:11 -0500
Subject: [PATCH 3/3] selftests: add option to print the time spent per test
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-kselftest-run-timer-v1-3-53a838b2d62b@xs4all.nl>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
In-Reply-To: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

There is currently no way to see how long each test took when running
kselftests through run_kselftest.sh. This information is useful for
CI/CD systems.

Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
prints a KTAP diagnostic line with the elapsed wall-clock time just
before the result line of each test that is actually run, e.g.:

  # selftests: timers: nanosleep
  # time: 12.34s
  ok 3 selftests: timers: nanosleep

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/kselftest/runner.sh | 22 +++++++++++++++++++++-
 tools/testing/selftests/run_kselftest.sh    |  8 ++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 06748af6fcf7..60e3bba518ed 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -16,6 +16,7 @@ export timeout_rc=124
 export logfile=/dev/stdout
 export per_test_logging=
 export per_test_log_dir=/tmp
+export per_test_timing=
 export RUN_IN_NETNS=
 
 # Defaults for "settings" file fields:
@@ -56,10 +57,20 @@ tap_timeout()
 	fi
 }
 
+# Print the system uptime in hundredths of a second.
+uptime_cs()
+{
+	local up idle
+
+	read up idle < /proc/uptime
+	# Prefix the fraction with 1 so that a leading 0 isn't parsed as octal.
+	echo $((${up%.*} * 100 + 1${up#*.} - 100))
+}
+
 run_one()
 {
 	local DIR TEST BASENAME_TEST BASENAME_SANITIZED SETTINGS TEST_HDR_MSG
-	local line field value interpreter stdbuf cmd rc
+	local line field value interpreter stdbuf cmd rc start elapsed
 
 	DIR="$1"
 	TEST="$2"
@@ -145,10 +156,18 @@ run_one()
 			fi
 		fi
 		cd `dirname $TEST` > /dev/null
+		if [ -n "$per_test_timing" ]; then
+			start=$(uptime_cs)
+		fi
 		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
 			(read xs; exit $xs)) 4>>"$logfile"
 		rc=$?
+		if [ -n "$per_test_timing" ]; then
+			elapsed=$(($(uptime_cs) - start))
+			ktap_print_msg "$(printf 'time: %d.%02ds' \
+				$((elapsed / 100)) $((elapsed % 100)))"
+		fi
 		case "$rc" in
 		"$KSFT_PASS")
 			ktap_test_pass "$TEST_HDR_MSG";;
@@ -175,6 +194,7 @@ in_netns()
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
 		kselftest_override_timeout=$kselftest_override_timeout
+		per_test_timing=$per_test_timing
 		run_one $DIR $TEST
 	EOF
 }
diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index e11b0e93ba41..0f2a8c619a9c 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -32,6 +32,7 @@ Usage: $0 [OPTIONS]
   -n | --netns			Run each test in namespace
   -h | --help			Show this usage info
   -o | --override-timeout	Number of seconds after which we timeout
+  -T | --timed			Print the time spent on each test
 EOF
 	exit $1
 }
@@ -101,6 +102,13 @@ while true; do
 		-o | --override-timeout)
 			kselftest_override_timeout="$2"
 			shift 2 ;;
+		-T | --timed)
+			if [ ! -r /proc/uptime ]; then
+				echo "Timing tests requires /proc/uptime" >&2
+				exit 1
+			fi
+			per_test_timing=1
+			shift ;;
 		-h | --help)
 			usage 0 ;;
 		"")

-- 
2.56.1

